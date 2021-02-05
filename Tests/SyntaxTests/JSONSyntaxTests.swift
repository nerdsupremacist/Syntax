import XCTest
import Syntax

final class JSONSyntaxTests: XCTestCase {

    func testParsesObject() {
        let text = """
        {
            "greeting" : "hello world!",
            "int" : 42,
            "bool" : false,
            "other" : null
        }
        """

        let json = try! JSONParser().parse(text)
        XCTAssertEqual(
            json,
            [
                "greeting" : "hello world!",
                "int" : 42,
                "bool" : false,
                "other" : nil,
            ]
        )

        let syntaxTree = try! JSONParser().syntaxTree(text)
        print(String(data: try! JSONEncoder().encode(syntaxTree), encoding: .utf8)!)
    }

    func testAnnotations() {
        let text = """
        Hello World!: "hello\\n\\\"world"
        """

        let syntaxTree = try! Annotated {
            JSONParser()
        }
        .syntaxTree(text)

        print(String(data: try! JSONEncoder().encode(syntaxTree), encoding: .utf8)!)
    }
}
