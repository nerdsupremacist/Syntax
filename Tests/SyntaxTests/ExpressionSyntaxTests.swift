import XCTest
import Syntax

enum FizzBuzzValue {
    case number(Int)
    case fizz
    case buzz
    case fizzBuzz
}

struct FizzBuzzParser: Parser {
    var body: AnyParser<[FizzBuzzValue]> {
        Repeat {
            Either {
                IntLiteral().map { FizzBuzzValue.number($0) }

                Word("FizzBuzz").map(to: FizzBuzzValue.fizzBuzz).kind("keyword.fizzbuzz")
                Word("Fizz").map(to: FizzBuzzValue.fizz).kind("keyword.fizz")
                Word("Buzz").map(to: FizzBuzzValue.buzz).kind("keyword.buzz")
            }
        }
    }
}

final class ExpressionSyntaxTests: XCTestCase {
    func testFizzBuzz() {
        let text = "1 2 Fizz"
        let syntaxTree = try! FizzBuzzParser().syntaxTree(text)
        print(String(data: try! JSONEncoder().encode(syntaxTree), encoding: .utf8)!)
    }

    func testNumberYieldsThatNumber() {
        check("4", equals: 4)
        check("4.5", equals: 4.5)
    }

    func testSimpleAdditionYieldsTheCorrectValue() {
        check("2+2", equals: 4)
    }

    func testParserOmitsWhitespcaes() {
//        check("   12        -  8   ", equals: 4)
//        check("142        -9   ", equals: 133)
//        check("72+  15", equals: 87)
        check("2 + ( 72+  15) * 2", equals: 176)
//        check(" 12*  4", equals: 48)
//        check(" 50/10", equals: 5)
    }

    func testLongAdditiveExpressionsAreComputedLeftToRight() {
//        check("2 -4 +6 -1 -1- 0 +8", equals: 10)
//        check("1 -1   + 2   - 2   +  4 - 4 +    6", equals: 6)
    }

    func testFailsToParseEmpty() {
        fails(" ")
        fails("1 + *")
    }
}

extension ExpressionSyntaxTests {

    private func check(_ text: String, equals expected: Double) {
        do {
            let expression = try ExpressionParser().parse(text)
            let value = expression.eval()
            XCTAssertTrue(abs(value - expected) < 1e-6, "Expected \(text) = \(expected). But it evaluated to \(value)")
        } catch {
            XCTFail("Failed to parse \(text) due to: \(error)")
        }
    }
    private func fails(_ text: String) {
        XCTAssertThrowsError(try ExpressionParser().parse(text))
    }

}
