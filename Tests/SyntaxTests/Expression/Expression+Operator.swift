
import Foundation
import Syntax

extension Expression {

    enum Operator: Int, BinaryOperator, CaseIterable {
        case power
        case multiply
        case divide
        case minus
        case plus

        var operatorString: String {
            switch self {
            case .power:
                return "^"
            case .multiply:
                return "*"
            case .divide:
                return "/"
            case .plus:
                return "+"
            case .minus:
                return "-"
            }
        }

        var parser: AnyParser<Void> {
            operatorString
                .annotate {
                    return ["name" : "\(self)"]
                }
        }

        var associativity: Associativity {
            switch self {
            case .power:
                return .right
            default:
                return .left
            }
        }

        func precedes(_ other: Operator) -> Bool {
            return rawValue < other.rawValue
        }

        func compute(lhs: Double, rhs: Double) -> Double {
            switch self {
            case .power:
                return pow(lhs, rhs)
            case .multiply:
                return lhs * rhs
            case .divide:
                return lhs / rhs
            case .plus:
                return lhs + rhs
            case .minus:
                return lhs - rhs
            }
        }
    }


}
