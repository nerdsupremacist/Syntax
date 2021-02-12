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
        Hello World!: { "greeting" : "hello\\n\\\"world" }
        """

        let syntaxTree = try! Annotated {
            JSONParser()
        }
        .syntaxTree(text)

        print(String(data: try! JSONEncoder().encode(syntaxTree), encoding: .utf8)!)
    }

    func testCaching() {
        let cache = Cache<JSON>(capacity: 3)
        let parser = JSONParser()

        let first = """
        { "greeting" : "hello world" }
        """

        let firstParsed = try! parser.parse(first, cache: cache)
        print(firstParsed)

        let second = """
        { "greeting" : "hello world!" }
        """

        let secondParsed = try! parser.parse(second, cache: cache)
        print(secondParsed)

        let third = """
        { "greeting" : "hello world", "int": 1 }
        """

        let thirdParsed = try! parser.parse(third, cache: cache)
        print(thirdParsed)


        let fourth = """
        { "hi" : "this is a test" }
        """

        let fourthParsed = try! parser.parse(fourth, cache: cache)
        print(fourthParsed)
    }
}
