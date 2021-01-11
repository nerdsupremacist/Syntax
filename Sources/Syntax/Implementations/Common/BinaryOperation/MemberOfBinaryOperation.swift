
import Foundation

public protocol MemberOfBinaryOperation {
    associatedtype Operator: BinaryOperator
    static func binaryOperation(_ operation: BinaryOperation<Self, Self.Operator>) -> Self
}
