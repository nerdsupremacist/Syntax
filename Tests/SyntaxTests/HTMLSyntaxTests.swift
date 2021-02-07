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

        let html = try! HTMLNodeParser().parse(text)
        print(html)
    }
}
