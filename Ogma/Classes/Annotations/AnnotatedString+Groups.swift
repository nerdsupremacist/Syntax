//
//  AnnotatedString+groupped.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/26/19.
//

import Foundation

enum AnnotatedGroup<T> {

    struct Annotation {
        let text: String
        let annotation: T
    }

    case text(String)
    case annotations([Annotation])
}

extension Array {

    func groups<Annotation>() -> [AnnotatedGroup<Annotation>] where Element == AnnotationElement<Annotation> {
        return map { $0.group }
            .merge { previous, current in
                switch (previous, current) {
                case (.text(let lhs), .text(let rhs)):
                    return .text(lhs + rhs)
                case (.annotations(let lhs), .annotations(let rhs)):
                    return .annotations(lhs + rhs)
                default:
                    return nil
                }
            }
    }

}

extension AnnotationElement {

    fileprivate var group: AnnotatedGroup<Annotation> {
        switch self {
        case .text(let text):
            return .text(text)
        case .annotated(let text, let annotation):
            return .annotations([.init(text: text, annotation: annotation)])
        }
    }

}
