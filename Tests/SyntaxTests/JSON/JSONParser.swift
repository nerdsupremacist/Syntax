
import Syntax

struct JSONParser: Parser {
    struct JSONArrayParser: Parser {
        let json: AnyParser<JSON>

        var body: any Parser<[JSON]> {
            "[".kind(.jsonArrayStartDelimiter)

            json.separated(by: ",")

            "]".kind(.jsonArrayEndDelimiter)
        }
    }

    struct JSONDictionaryParser: Parser {
        let json: AnyParser<JSON>

        var body: any Parser<[String : JSON]> {
            "{".kind(.jsonDictionaryStartDelimiter)

            Group {
                StringLiteral()

                ":"

                json
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
        Recursive { parser in
            Either {
                JSONDictionaryParser(json: parser).map(JSON.object)
                JSONArrayParser(json: parser).map(JSON.array)

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
}

extension Kind {

    static let nullLiteral: Kind = "null.literal"

    static let jsonDictionaryKeyValuePair: Kind = "json.dictionary.keyvaluepair"
    static let jsonDictionaryStartDelimiter: Kind = "json.dictionary.delimiter.start"
    static let jsonDictionaryEndDelimiter: Kind = "json.dictionary.delimiter.end"

    static let jsonArrayStartDelimiter: Kind = "json.array.delimiter.start"
    static let jsonArrayEndDelimiter: Kind = "json.array.delimiter.end"

}
