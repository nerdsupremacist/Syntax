
import Foundation

public struct BinaryOperation<Member, Operator> {
    @Located
    public var lhs: Member

    @Located
    public var operation: Operator

    @Located
    public var rhs: Member
}
