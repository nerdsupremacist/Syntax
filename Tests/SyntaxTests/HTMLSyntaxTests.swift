import XCTest
import Syntax

final class HTMLSyntaxTests: XCTestCase {

    func testParagraph() {
        let text = """
        <p>Hello World: <a href="link">link</a></p>
        """

        let html = try! HTMLNodeParser().parse(text)
        print(html)
    }
}
