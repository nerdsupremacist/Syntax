
import Foundation
import Syntax

struct ExpressionParser: RecursiveParser {
    var body: any Parser<Expression> {
        Either {
            BinaryOperationParser {
                ExpressionParser()
            }
            .map(Expression.binaryOperation)

            Group {
                "("

                ExpressionParser()

                ")"
            }
            .map(Expression.wrapped)

            IntLiteral().map(Expression.int)

            DoubleLiteral().map(Expression.double)
        }
    }
}
