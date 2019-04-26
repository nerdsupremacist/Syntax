//
//  AnnotatedString.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

public enum AnnotationElement<Annotation> {
    case text(String)
    case annotated(String, Annotation)
}

extension AnnotationElement {

    public func map<T>(_ transform: (String, Annotation) throws -> T) rethrows -> AnnotationElement<T> {
        switch self {
        case .text(let text):
            return .text(text)
        case .annotated(let text, let annotation):
            return .annotated(text, try transform(text, annotation))
        }
    }

    public func map<T>(_ transform: (Annotation) throws -> T) rethrows -> AnnotationElement<T> {
        switch self {
        case .text(let text):
            return .text(text)
        case .annotated(let text, let annotation):
            return .annotated(text, try transform(annotation))
        }
    }

    public func compactMap<T>(_ transform: (Annotation) throws -> T?) rethrows -> AnnotationElement<T> {
        switch self {
        case .text(let text):
            return .text(text)
        case .annotated(let text, let annotation):
            return try transform(annotation)
                .map { .annotated(text, $0) } ?? .text(text)
        }
    }

}

public typealias AnnotatedString<Annotation> = [AnnotationElement<Annotation>]

extension Array {

    public func map<Annotation, T>(
        _ transform: (Annotation) throws -> T
    ) rethrows -> AnnotatedString<T> where Element == AnnotationElement<Annotation> {

        return try map { try $0.map(transform) }
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

    func grouppingAnnotations<Annotation>()
        -> AnnotatedString<[AnnotationContext<Annotation>]> where Element == AnnotationElement<Annotation> {

        return map { $0.map { [AnnotationContext(text: $0, value: $1)] } }
            .merge { previous, current in
                switch (previous, current) {
                case (.text(let lhs), .text(let rhs)):
                    return .text(lhs + rhs)
                case (.annotated(let lhsText, let lhsAnnotation), .annotated(let rhsText, let rhsAnnotation)):
                    return .annotated(lhsText + rhsText, lhsAnnotation + rhsAnnotation)
                default:
                    return nil
            }
        }
    }

}

struct AnnotationContext<Value> {
    let text: String
    let value: Value
}
