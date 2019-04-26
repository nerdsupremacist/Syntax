//
//  AnnotatedElement.swift
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
