//
//  AnnotatedString.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

public typealias AnnotatedString<Annotation> = [AnnotationElement<Annotation>]

extension Array {

    public func map<Annotation, T>(
        _ transform: (Annotation) throws -> T
    ) rethrows -> AnnotatedString<T> where Element == AnnotationElement<Annotation> {

        return try map { try $0.map(transform) }
    }

    public func map<Annotation>(_ transform: (Annotation) throws -> String) rethrows -> String where Element == AnnotationElement<Annotation> {

        return try map { element in
            switch element {
            case .text(let text):
                return text
            case .annotated(_, let value):
                return try transform(value)
            }
        }
        .joined()
    }

    public func compactMap<Annotation, T>(
        _ transform: (Annotation) throws -> T?
    ) rethrows -> AnnotatedString<T> where Element == AnnotationElement<Annotation> {

        return try map { try $0.compactMap(transform) }
            .clean()
    }

    func clean<Annotation>() -> [Element] where Element == AnnotationElement<Annotation> {
        return merge { previous, current in
            guard case .text(let lhs) = previous, case .text(let rhs) = current else { return nil }
            return .text(lhs + rhs)
        }
    }

}

extension Array {

    public func string<Value, Token>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]? = nil,
        _ attributedString: (String, Value, Token) throws -> NSAttributedString
    ) rethrows -> NSAttributedString where Element == AnnotationElement<ParsedAnnotation<Value, Token>> {

        let annotated = flatMap { annotation -> AnnotatedString<(Value, Token)> in
            switch annotation {
            case .annotated(_, let annotation):
                return annotation.annotatedString.map { (annotation.value, $0) }
            case .text(let string):
                return [.text(string)]
            }
        }

        return try annotated.string(attributes: defaultAttributes) { try attributedString($0, $1.0, $1.1) }
    }

    public func string<Value, Token>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]? = nil,
        _ attributesHandler: (String, Value, Token) throws -> [NSAttributedString.Key : Any]
    ) rethrows -> NSAttributedString where Element == AnnotationElement<ParsedAnnotation<Value, Token>> {

        let annotated = flatMap { annotation -> AnnotatedString<(Value, Token)> in
            switch annotation {
            case .annotated(_, let annotation):
                return annotation.annotatedString.map { (annotation.value, $0) }
            case .text(let string):
                return [.text(string)]
            }
        }

        return try annotated._string(attributes: defaultAttributes) {
            return try attributesHandler($0, $1.0, $1.1)
                .merging([.annotationValue : $1.0, .annotationToken: $1.1]) { $1 }
        }
    }

    public func string<Value, Token>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]? = nil,
        _ attributesHandler: (Value, Token) throws -> [NSAttributedString.Key : Any]
    ) rethrows -> NSAttributedString where Element == AnnotationElement<ParsedAnnotation<Value, Token>> {

        return try string(attributes: defaultAttributes) { try attributesHandler($1, $2) }
    }

}

extension Array {

    public func string<Annotation>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]? = nil,
        _ attributesHandler: (String, Annotation) throws -> [NSAttributedString.Key : Any]
    ) rethrows -> NSAttributedString where Element == AnnotationElement<Annotation> {
        return try _string(attributes: defaultAttributes) {
            return try attributesHandler($0, $1)
                .merging([.annotationValue : $1]) { $1 }
        }
    }

    public func string<Annotation>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]? = nil,
        _ attributesHandler: (Annotation) throws -> [NSAttributedString.Key : Any]
    ) rethrows -> NSAttributedString where Element == AnnotationElement<Annotation> {

        return try string(attributes: defaultAttributes) { try attributesHandler($1) }
    }

}

extension Array {

    private func _string<Annotation>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]? = nil,
        _ attributesHandler: (String, Annotation) throws -> [NSAttributedString.Key : Any]
    ) rethrows -> NSAttributedString where Element == AnnotationElement<Annotation> {
        return try string(attributes: defaultAttributes) { text, annotation in
            return NSAttributedString(string: text,
                                      attributes: try attributesHandler(text, annotation))
        }
    }

    public func string<Annotation>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]?,
        _ attributedString: (String, Annotation) throws -> NSAttributedString
    ) rethrows -> NSAttributedString where Element == AnnotationElement<Annotation> {

        let strings: [NSAttributedString] = try map { element in

            switch element {
            case .text(let text):
                return NSAttributedString(string: text, attributes: defaultAttributes)
            case .annotated(let string, let annotation):
                return try attributedString(string, annotation)
            }
        }

        return strings.reduce(into: NSMutableAttributedString()) { $0.append($1) }
    }

}

extension NSAttributedString.Key {

    public static let annotationValue = NSAttributedString.Key("Ogma.AnnotationValue")
    public static let annotationToken = NSAttributedString.Key("Ogma.AnnotationToken")

}
