
import Foundation
import Syntax

public class HTMLNode {
    public enum Attribute {
        case flag(Substring)
        case set(Substring, String)
    }

    public let tag: Substring
    public let attributes: [Attribute]
    public let contents: AnnotatedString<HTMLNode>

    init(tag: Substring, attributes: [Attribute], contents: AnnotatedString<HTMLNode>) {
        self.tag = tag
        self.attributes = attributes
        self.contents = contents
    }
}
