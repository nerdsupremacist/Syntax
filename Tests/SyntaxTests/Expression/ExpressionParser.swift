
import Foundation
import Syntax

struct ExpressionParser: Parser {
    var body: any Parser<Expression> {
        Recursive { parser in
            Either {
                BinaryOperationParser {
                    parser
                }
                .map(Expression.binaryOperation)

                Group {
                    "("

                    parser

                    ")"
                }
                .map(Expression.wrapped)

                IntLiteral().map(Expression.int)

                DoubleLiteral().map(Expression.double)
            }
        }
    }
}
