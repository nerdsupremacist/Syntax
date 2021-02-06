import XCTest
import Syntax

final class ExpressionSyntaxTests: XCTestCase {
    func testNumberYieldsThatNumber() {
        check("4", equals: 4)
        check("4.5", equals: 4.5)
    }

    func testSimpleAdditionYieldsTheCorrectValue() {
        check("2+2", equals: 4)
    }

    func testParserOmitsWhitespcaes() {
        check("   12        -  8   ", equals: 4)
        check("142        -9   ", equals: 133)
        check("72+  15", equals: 87)
        check("2 + ( 72+  15) * 2", equals: 176)
        check(" 12*  4", equals: 48)
        check(" 50/10", equals: 5)
    }

    func testLongAdditiveExpressionsAreComputedLeftToRight() {
        check("2 -4 +6 -1 -1- 0 +8", equals: 10)
        check("1 -1   + 2   - 2   +  4 - 4 +    6", equals: 6)
    }

    func testLongMixedAdditiveAndMultiplicativeExpressionsAreLeftToRight() {
        check(" 2*3 - 4*5 + 6/3 ", equals: -12)
        check("2*3*4/8 -   5/2*4 +  6 + 0/3   ", equals: -1)
    }

    func testPowerIsRightAssociative() {
        check("2^3^2", equals: 512)
    }

    func testFailsToParseEmpty() {
        fails(" ")
        fails("1 + *")
    }

    func testAnnotatingResults() throws {
        checkAnnotatedString("Let's see: 1 + 1", equals: "Let's see: 1 + 1 = 2")
        checkAnnotatedString("Please calculate: 2^3^2", equals: "Please calculate: 2^3^2 = 512")
    }
}

extension ExpressionSyntaxTests {

    private func checkAnnotatedString(_ text: String, equals expected: String) {
        do {
            let numberFormatter = NumberFormatter()
            let annotatedString = try ExpressionParser().annotated(text)
            let finalString = annotatedString.string { substring, expression -> String in
                let result = expression.eval()
                let resultString = numberFormatter.string(from: result as NSNumber)!
                return "\(substring) = \(resultString)"
            }
            XCTAssertEqual(finalString, expected)
        } catch {
            XCTFail("Failed to parse \(text) due to: \(error)")
        }
    }

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
