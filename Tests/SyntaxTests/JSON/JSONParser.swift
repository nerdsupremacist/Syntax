
import Syntax

struct JSONParser: Parser {
    struct ArrayParser: Parser {
        let json: AnyParser<JSON>

        var body: AnyParser<[JSON]> {
            "["

            json.separated(by: ",")

            "]"
        }
    }

    struct DictionaryParser: Parser {
        let json: AnyParser<JSON>

        var body: AnyParser<[String : JSON]> {
            "{"

            Group {
                StringLiteral()

                ":"

                json
            }
            .separated(by: ",")
            .map { values in
                return Dictionary(values) { $1 }
            }

            "}"
        }
    }
    
    var body: AnyParser<JSON> {
        Recursive { parser in
            Either {
                DictionaryParser(json: parser).map(JSON.object)
                ArrayParser(json: parser).map(JSON.array)

                StringLiteral().map(JSON.string)
                IntLiteral().map(JSON.int)
                DoubleLiteral().map(JSON.double)

                Word("true").map(to: JSON.bool(true)).kind(.boolLiteral)
                Word("false").map(to: JSON.bool(true)).kind(.boolLiteral)
                Word("null").kind(.nullLiteral).map(to: JSON.null)
            }
        }
    }
}

extension Kind {

    static let boolLiteral: Kind = "bool.literal"
    static let nullLiteral: Kind = "null.literal"

}
