
import Foundation
import Syntax

enum HTMLParserError: Error, LocalizedError {
    case unmatchedClosingTag(Substring)

    var errorDescription: String? {
        switch self {
        case .unmatchedClosingTag(let tag):
            return "Couldn't find a closing tag for <\(tag)>"
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .unmatchedClosingTag(let tag):
            return "Include a closing tag </\(tag)>"
        }
    }
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
        return Leaf {
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
        return Leaf {
            "<"

            RegularExpression("[a-zA-Z][-a-zA-Z0-9]*")

            Repeat {
                AttributeParser()
            }

            ">"
        }
        .map { BeginTag(tag: $0.text, attributes: $1) }
        .annotate { tag in
            let attributeDictionary = Dictionary(tag.attributes.map { $0.keyValue() }) { lhs, rhs in lhs }
            return ["html.attributes" : attributeDictionary, "html.tag" : String(tag.tag)]
        }
    }
}

private struct EndTagParser: Parser {
    var body: AnyParser<EndTag> {
        return Leaf {
            "</"

            RegularExpression("[a-zA-Z][-a-zA-Z0-9]*")

            ">"
        }
        .map { EndTag(tag: $0.text) }
        .annotate { tag in
            return ["html.tag" : String(tag.tag)]
        }
    }
}

extension HTMLNode.Attribute {

    fileprivate func keyValue() -> (String, String) {
        switch self {
        case .flag(let string):
            return (String(string), "true")
        case .set(let string, let value):
            return (String(string), value)
        }
    }

}
