
import Foundation

enum JSON: Equatable {
    case object([String : JSON])
    case array([JSON])
    case int(Int)
    case double(Double)
    case bool(Bool)
    case string(String)
    case null
}

extension JSON: ExpressibleByStringLiteral {

    init(stringLiteral value: String) {
        self = .string(value)
    }

}

extension JSON: ExpressibleByFloatLiteral {

    init(floatLiteral value: Double) {
        self = .double(value)
    }

}

extension JSON: ExpressibleByIntegerLiteral {

    init(integerLiteral value: Int) {
        self = .int(value)
    }

}

extension JSON: ExpressibleByBooleanLiteral {

    init(booleanLiteral value: Bool) {
        self = .bool(value)
    }

}

extension JSON: ExpressibleByArrayLiteral {

    init(arrayLiteral elements: JSON...) {
        self = .array(elements)
    }

}

extension JSON: ExpressibleByDictionaryLiteral {

    init(dictionaryLiteral elements: (String, JSON)...) {
        self = .object(Dictionary(uniqueKeysWithValues: elements))
    }

}

extension JSON: ExpressibleByNilLiteral {

    init(nilLiteral: ()) {
        self = .null
    }

}
