
import Foundation

public protocol BinaryOperator {
    @ParserBuilder
    var parser: any Parser<Void> { get }
    
    var associativity: Associativity { get }

    func precedes(_ other: Self) -> Bool
}

extension BinaryOperator {

    public var associativity: Associativity {
        return .left
    }

}

extension BinaryOperator where Self: Comparable {

    public func precedes(_ other: Self) -> Bool {
        return self < other
    }

}
