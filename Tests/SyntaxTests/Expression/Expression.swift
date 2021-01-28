
import Foundation
import Syntax

final class Expression: MemberOfBinaryOperation {
    private enum Storage {
        case int(Int)
        case double(Double)
        case wrapped(Expression)
        case binaryOperation(Syntax.BinaryOperation<Expression, Expression.Operator>)
    }

    private let storage: Storage

    private init(_ storage: Storage) {
        self.storage = storage
    }

    static func int(_ int: Int) -> Expression {
        return Expression(.int(int))
    }

    static func double(_ double: Double) -> Expression {
        return Expression(.double(double))
    }

    static func wrapped(_ expression: Expression) -> Expression {
        return Expression(.wrapped(expression))
    }

    static func binaryOperation(_ operation: Syntax.BinaryOperation<Expression, Expression.Operator>) -> Expression {
        return Expression(.binaryOperation(operation))
    }
}


extension Expression {

    func eval() -> Double {
        switch storage {
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
