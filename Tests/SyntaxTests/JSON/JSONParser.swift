
import Syntax

struct JSONParser: RecursiveParser {
    struct JSONArrayParser: Parser {
        var body: any Parser<[JSON]> {
            "[".kind(.jsonArrayStartDelimiter)

            JSONParser().separated(by: ",")

            "]".kind(.jsonArrayEndDelimiter)
        }
    }

    struct JSONDictionaryParser: Parser {
        var body: any Parser<[String : JSON]> {
            "{".kind(.jsonDictionaryStartDelimiter)

            Group {
                StringLiteral()

                ":"

                JSONParser()
            }
            .kind(.jsonDictionaryKeyValuePair)
            .separated(by: ",")
            .map { values in
                return Dictionary(values) { $1 }
            }

            "}".kind(.jsonDictionaryEndDelimiter)
        }
    }
    
    var body: any Parser<JSON> {
        Either {
            JSONDictionaryParser().map(JSON.object)
            JSONArrayParser().map(JSON.array)

            StringLiteral()
                .escapeStrategy(JavaScriptEscapeStrategy())
                .map(JSON.string)

            IntLiteral().map(JSON.int)
            DoubleLiteral().map(JSON.double)
            BooleanLiteral().map(JSON.bool)

            Word("null").kind(.nullLiteral).map(to: JSON.null)
        }
    }
}

extension Kind {

    static let nullLiteral: Kind = "null.literal"

    static let jsonDictionaryKeyValuePair: Kind = "json.dictionary.keyvaluepair"
    static let jsonDictionaryStartDelimiter: Kind = "json.dictionary.delimiter.start"
    static let jsonDictionaryEndDelimiter: Kind = "json.dictionary.delimiter.end"

    static let jsonArrayStartDelimiter: Kind = "json.array.delimiter.start"
    static let jsonArrayEndDelimiter: Kind = "json.array.delimiter.end"

}
