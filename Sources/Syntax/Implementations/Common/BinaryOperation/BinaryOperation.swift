
import Foundation

public struct BinaryOperation<Member, Operator> {
    public let lhs: Member
    public let operation: Operator
    public let rhs: Member
}
