
import Foundation

extension Parser {

    public func separated(by separator: String, allowTrailing: Bool = false) -> AnyParser<[Output]> {
        return Separated(source: self, separator: separator, allowTrailing: allowTrailing).map { $0.map { $0.0 } }
    }

    public func separated<Separator : Parser>(allowTrailing: Bool = false, @ParserBuilder by separator: () -> Separator) -> AnyParser<[(Output, Separator.Output?)]> {
        return Separated(source: self, separator: separator(), allowTrailing: allowTrailing).eraseToAnyParser()
    }

    public func separated<Separator : Parser>(allowTrailing: Bool = false, @ParserBuilder by separator: () -> Separator) -> AnyParser<[Output]> where Separator.Output == Void {
        return Separated(source: self, separator: separator(), allowTrailing: allowTrailing).map { $0.map { $0.0 } }
    }

}

private struct Separated<Source: Parser, Separator: Parser>: Parser {
    fileprivate let source: Source
    fileprivate let separator: Separator
    fileprivate let allowTrailing: Bool

    var body: AnyParser<[(Source.Output, Separator.Output?)]> {
        Group {
            source

            Group {
                separator
                source
            }
            .repeat()

            allowTrailing ? separator.maybe() : nil
        }
        .map { result -> [(Source.Output, Separator.Output?)] in
            let (firstItem, grouped, lastSeparator) = result
            let items = [firstItem] + grouped.map { $1 }
            let separators = grouped.map { Optional.some($0.0) } + [lastSeparator.flatMap { $0 }]
            return Array(zip(items, separators))
        }
        .maybe(default: [])
    }
}
