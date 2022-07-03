
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

// Parses full HTML
@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
struct HTMLNodeParser: RecursiveParser {
    var body: any Parser<HTMLNode> {
        Either {
            HTMLNodeWithChildrenParser()
            SingleHTMLNodeParser()
        }
    }
}

// Parses an xml compatible name. See: https://www.w3.org/TR/REC-xml/#NT-Name
@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct IdentifierParser: RecursiveParser {
    var body: any Parser<Substring> {
        Regex {
            NameStartCharacter()
            ZeroOrMore {
                NameCharacter()
            }
        }
    }
}

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct NameStartCharacter: RegexComponent {
    var regex: Regex<Substring> {
        Regex {
            ChoiceOf {
                ":"
                ("A"..."Z")
                "_"
                ("a"..."z")
                ("\u{C0}"..."\u{D6}")
                ("\u{D8}"..."\u{F6}")
                ("\u{F8}"..."\u{2FF}")
                ("\u{370}"..."\u{37D}")
                ("\u{37F}"..."\u{1FFF}")
                ("\u{200C}"..."\u{200D}")
                ("\u{2070}"..."\u{218F}")
                ("\u{2C00}"..."\u{2FEF}")
                ("\u{3001}"..."\u{D7FF}")
                ("\u{F900}"..."\u{FDFC}")
                ("\u{FDF0}"..."\u{FFFD}")
                ("\u{10000}"..."\u{EFFFF}")
            }
        }
    }
}

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct NameCharacter: RegexComponent {
    var regex: Regex<Substring> {
        Regex {
            ChoiceOf {
                NameStartCharacter()
                "-"
                "."
                "\u{B7}"
                Regex {
                    "\\"
                    One(.any)
                }
                One(.digit)
                ("\u{0300}"..."\u{036F}")
                ("\u{203F}"..."\u{2040}")
            }
        }
    }
}

// Parses: <MyTag />
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
        .annotate { node in
            let attributeDictionary = Dictionary(node.attributes.map { $0.keyValue() }) { lhs, rhs in lhs }
            return ["html.attributes" : attributeDictionary, "html.tag" : String(node.tag)]
        }
    }

}


// Parses: <MyTag annotation="value">{children}</MyTag>
@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct HTMLNodeWithChildrenParser: Parser {
    var body: any Parser<HTMLNode> {
        return Group {
            BeginTagParser()

            AnnotatedUntil(content: { HTMLNodeParser() }) {
                EndTagParser()
            }
        }
        .map { beginTag, annotationTuple in
            let (annotated, endTag) = annotationTuple
            guard endTag.tag == beginTag.tag else { throw HTMLParserError.unmatchedClosingTag(endTag.tag) }
            return HTMLNode(tag: beginTag.tag, attributes: beginTag.attributes, contents: annotated)
        }
        .annotate { node in
            let attributeDictionary = Dictionary(node.attributes.map { $0.keyValue() }) { lhs, rhs in lhs }
            return ["html.attributes" : attributeDictionary, "html.tag" : String(node.tag)]
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

// Parses: annotation="value"
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

// Parses: <MyTag annotation="value">
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
    }
}

// Parses: </MyTag>
@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
private struct EndTagParser: Parser {
    var body: any Parser<EndTag> {
        return Leaf {
            "</"

            IdentifierParser()

            ">"
        }
        .map { EndTag(tag: $0) }
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
