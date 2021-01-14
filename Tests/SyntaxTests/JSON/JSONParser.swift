
import Syntax
import SyntaxTree

struct JSONParser: Parser {
    struct JSONArrayParser: Parser {
        let json: AnyParser<JSON>

        var body: AnyParser<[JSON]> {
            "["

            json.separated(by: ",")

            "]"
        }
    }

    struct JSONDictionaryParser: Parser {
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
                JSONDictionaryParser(json: parser).map(JSON.object)
                JSONArrayParser(json: parser).map(JSON.array)

                StringLiteral().map(JSON.string)
                IntLiteral().map(JSON.int)
                DoubleLiteral().map(JSON.double)
                BooleanLiteral().map(JSON.bool)
                
                Word("null").kind(.nullLiteral).map(to: JSON.null)
            }
        }
    }
}

extension Kind {

    static let boolLiteral: Kind = "bool.literal"
    static let nullLiteral: Kind = "null.literal"

}
