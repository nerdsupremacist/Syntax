
import Foundation
import Syntax

enum HTMLParserError: Error {
    case unmatchedClosingTag(Substring)
}

struct HTMLNodeParser: Parser {

    var body: AnyParser<HTMLNode> {
        Recursive { parser in
            Either {
                HTMLNodeWithChildrenParser(parser: parser)
                SingleHTMLNodeParser()
            }
        }
    }

}

private struct SingleHTMLNodeParser: Parser {
    var body: AnyParser<HTMLNode> {
        return Group {
            "<"

            RegularExpression("[a-zA-Z][-a-zA-Z0-9]*")

            Repeat {
                AttributeParser()
            }

            "/>"
        }
        .map { HTMLNode(tag: $0.text, attributes: $1, contents: nil) }
    }

}

private struct HTMLNodeWithChildrenParser: Parser {
    let parser: AnyParser<HTMLNode>

    var body: AnyParser<HTMLNode> {
        return Group {
            BeginTagParser()

            AnnotatedUntil(content: { parser }) {
                EndTagParser()
            }
        }
        .map { beginTag, annotationTuple in
            let (annotated, endTag) = annotationTuple
            guard endTag.tag == beginTag.tag else { throw HTMLParserError.unmatchedClosingTag(endTag.tag) }
            return HTMLNode(tag: beginTag.tag, attributes: beginTag.attributes, contents: annotated)
        }
    }

}

private enum HTMLNodeTag {
    case begin(BeginTag)
    case end(EndTag)
}

private struct BeginTag {
    let tag: Substring
    let attributes: [HTMLNode.Attribute]
}

private struct EndTag {
    let tag: Substring
}

private struct AttributeParser: Parser {
    var body: AnyParser<HTMLNode.Attribute> {
        Either {
            Group {
                RegularExpression("[a-zA-Z][-a-zA-Z0-9]*").map { match in
                    return match.text
                }

                "="

                Either {
                    IntLiteral().map(String.init)
                    StringLiteral()
                }
            }
            .map { HTMLNode.Attribute.set($0, $1) }

            RegularExpression("[a-zA-Z][-a-zA-Z0-9]*").map { HTMLNode.Attribute.flag($0.text) }
        }
    }
}

private struct BeginTagParser: Parser {
    var body: AnyParser<BeginTag> {
        return Group {
            "<"

            RegularExpression("[a-zA-Z][-a-zA-Z0-9]*")

            Repeat {
                AttributeParser()
            }

            ">"
        }
        .map { BeginTag(tag: $0.text, attributes: $1) }
    }
}

private struct EndTagParser: Parser {
    var body: AnyParser<EndTag> {
        return Group {
            "</"

            RegularExpression("[a-zA-Z][-a-zA-Z0-9]*")

            ">"
        }
        .map { EndTag(tag: $0.text) }
    }
}
