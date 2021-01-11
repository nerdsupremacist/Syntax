
import Foundation
import Syntax

indirect enum Expression: MemberOfBinaryOperation {
    case int(Int)
    case double(Double)
    case wrapped(Expression)
    case binaryOperation(Syntax.BinaryOperation<Expression, Expression.Operator>)
}

extension Expression {

    func eval() -> Double {
        switch self {
        case .int(let int):
            return Double(int)
        case .double(let double):
            return double
        case .wrapped(let wrapped):
            return wrapped.eval()
        case .binaryOperation(let operation):
            return operation.operation.compute(lhs: operation.lhs.eval(), rhs: operation.rhs.eval())
        }
    }

}
