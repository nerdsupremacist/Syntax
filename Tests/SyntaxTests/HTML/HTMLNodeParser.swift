
#if canImport(RegexBuilder)
import Foundation
import Syntax
import RegexBuilder

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

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
struct HTMLNodeParser: Parser {

    var body: any Parser<HTMLNode> {
        Recursive { parser in
            Either {
                HTMLNodeWithChildrenParser(parser: parser)
                SingleHTMLNodeParser()
            }
        }
    }

}

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct IdentifierParser: Parser {
    var body: any Parser<Substring> {
        Regex {
          CharacterClass(
            ("a"..."z"),
            ("A"..."Z")
          )
          ZeroOrMore {
            CharacterClass(
              .anyOf("-"),
              ("a"..."z"),
              ("A"..."Z"),
              ("0"..."9")
            )
          }
        }
    }
}

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct SingleHTMLNodeParser: Parser {
    var body: any Parser<HTMLNode> {
        return Leaf {
            "<"

            IdentifierParser()

            Repeat {
                AttributeParser()
            }

            "/>"
        }
        .map { HTMLNode(tag: $0, attributes: $1, contents: nil) }
    }

}

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct HTMLNodeWithChildrenParser: Parser {
    let parser: AnyParser<HTMLNode>

    var body: any Parser<HTMLNode> {
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

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct AttributeParser: Parser {
    var body: any Parser<HTMLNode.Attribute> {
        Either {
            Group {
                IdentifierParser()

                "="

                Either {
                    IntLiteral().map(String.init)
                    StringLiteral().escapeStrategy(JavaScriptEscapeStrategy())
                }
            }
            .map { HTMLNode.Attribute.set($0, $1) }

            IdentifierParser().map { HTMLNode.Attribute.flag($0) }
        }
    }
}

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct BeginTagParser: Parser {
    var body: any Parser<BeginTag> {
        return Leaf {
            "<"

            IdentifierParser()

            Repeat {
                AttributeParser()
            }

            ">"
        }
        .map { BeginTag(tag: $0, attributes: $1) }
        .annotate { tag in
            let attributeDictionary = Dictionary(tag.attributes.map { $0.keyValue() }) { lhs, rhs in lhs }
            return ["html.attributes" : attributeDictionary, "html.tag" : String(tag.tag)]
        }
    }
}

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct EndTagParser: Parser {
    var body: any Parser<EndTag> {
        return Leaf {
            "</"

            IdentifierParser()

            ">"
        }
        .map { EndTag(tag: $0) }
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
#endif
