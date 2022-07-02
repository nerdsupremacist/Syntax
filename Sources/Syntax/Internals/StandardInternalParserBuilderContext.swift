
import Foundation

struct StandardInternalParserBuilderContext: InternalParserBuilderContext {
    private var references: [AnyHashable : InternalParserReference] = [:]

    init() {}

    mutating func reference<T : Hashable>(_ value: T) -> InternalParserReference {
        let hashable = AnyHashable(value)
        if let reference = references[hashable] {
            return reference
        }

        let reference = InternalParserReference()
        references[hashable] = reference
        return reference
    }
}
