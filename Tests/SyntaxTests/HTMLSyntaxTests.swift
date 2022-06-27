import XCTest
import Syntax

final class HTMLSyntaxTests: XCTestCase {

    func testParagraph() {
        let text = """
        <p align="center">
            <img src="https://img.shields.io/badge/Swift-5.3-orange.svg" />
            <a href="https://swift.org/package-manager">
                <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
            </a>
            <a href="https://twitter.com/nerdsupremacist">
                <img src="https://img.shields.io/badge/twitter-@nerdsupremacist-blue.svg?style=flat" alt="Twitter: @nerdsupremacist" />
            </a>
        </p>
        """

        let syntaxTree = try! HTMLNodeParser().syntaxTree(text)
        print(String(data: try! JSONEncoder().encode(syntaxTree), encoding: .utf8)!)
    }

    func testUnmatchedTag() {
        let text = """
        <p align="center">
            <img src="https://img.shields.io/badge/Swift-5.3-orange.svg" />
            <a href="https://swift.org/package-manager">
                <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
            <a href="https://twitter.com/nerdsupremacist">
                <img src="https://img.shields.io/badge/twitter-@nerdsupremacist-blue.svg?style=flat" alt="Twitter: @nerdsupremacist" />
            </a>
        </p>
        """

        do {
            _ = try HTMLNodeParser().parse(text)
            XCTFail("Expected invalid html to fail")
        } catch let error as DiagnosticError {
            let message = error.message(file: URL(fileURLWithPath: "/tmp/HTMLSyntaxTests.swift"))
            XCTAssertEqual("/tmp/HTMLSyntaxTests.swift:7:9: error: Couldn\'t find a closing tag for <a>", message)
        } catch {
            XCTFail("Expected error to conform to diagnostic error")
        }
    }
}
