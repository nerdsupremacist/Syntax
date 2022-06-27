
import Foundation
@_exported import SyntaxTree

@dynamicMemberLookup
@propertyWrapper
public struct Located<Value> {
    public private(set) var wrappedValue: Value
    public let location: Range<Location>

    init(wrappedValue: Value, location: Range<Location>) {
        self.wrappedValue = wrappedValue
        self.location = location
    }

    public subscript<T>(dynamicMember keyPath: KeyPath<Value, Located<T>>) -> Located<T> {
        return wrappedValue[keyPath: keyPath]
    }

    public func map<T>(_ transform: (Value) throws -> T) rethrows -> Located<T> {
        return Located<T>(wrappedValue: try transform(wrappedValue), location: location)
    }
}

extension Parser {

    public func located() -> AnyParser<Located<Output>> {
        return mapWithLocation { Located(wrappedValue: $0, location: $1) }
    }

}
