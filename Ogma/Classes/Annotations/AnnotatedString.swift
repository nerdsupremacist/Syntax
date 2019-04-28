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

    public func string<Annotation>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]? = nil,
        _ attributesHandler: (String, Annotation) throws -> [NSAttributedString.Key : Any]
    ) rethrows -> NSAttributedString where Element == AnnotationElement<Annotation> {

        let strings: [NSAttributedString] = try map { element in

            let annotationAttributes = try element.annotation.map { annotation in
                return try attributesHandler(element.text, annotation)
                    .merging([.annotationValue : annotation]) { $1 }
            }

            let attributes = defaultAttributes?
                .merging(annotationAttributes ?? [:]) { $1 }

            return NSAttributedString(string: element.text,
                                      attributes: attributes)
        }

        return strings.reduce(into: NSMutableAttributedString()) { $0.append($1) }
    }

    public func string<Annotation>(
        attributes defaultAttributes: [NSAttributedString.Key : Any]? = nil,
        _ attributesHandler: (Annotation) throws -> [NSAttributedString.Key : Any]
    ) rethrows -> NSAttributedString where Element == AnnotationElement<Annotation> {

        return try string(attributes: defaultAttributes) { try attributesHandler($1) }
    }

}

extension NSAttributedString.Key {

    public static let annotationValue = NSAttributedString.Key("Ogma.AnnotationValue")

}
