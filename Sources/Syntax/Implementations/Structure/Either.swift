
import Foundation

public struct Either<Parsed>: Parser {
    let id = UUID()
    private let maxPrefixLength: Int
    private let prefixMap: [Int : [String : [Int]]]
    private let fallbackParsers: [Int]
    private let options: [InternalParser]

    private init(options: [AnyParser<Parsed>]) {
        self.options = options.map { $0 }
        var fallbackParsers = [Int]()
        var prefixMap = [Int : [String : [Int]]]()
        for (offset, option) in self.options.enumerated() {
            let prefixes = option.prefixes()
            guard !prefixes.isEmpty else {
                fallbackParsers.append(offset)
                continue
            }

            if prefixes.contains("") {
                fallbackParsers.append(offset)
            }

            for prefix in prefixes where !prefix.isEmpty {
                prefixMap[
                    prefix.count,
                    default: [:]
                ][
                    prefix,
                    default: []
                ].append(offset)
            }
        }
        self.maxPrefixLength = prefixMap.map(\.key).max() ?? 0
        self.fallbackParsers = fallbackParsers
        self.prefixMap = prefixMap
    }

    public init(@EitherParserBuilder options: () -> [AnyParser<Parsed>]) {
        self.init(options: options())
    }

    public var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension Either {

    public init<S : Sequence, T: Parser<Parsed>>(_ data: S, @ParserBuilder option: (S.Element) -> T) {
        self.init(options:  data.map { option($0).eraseToAnyParser() })
    }

}

extension Either: InternalParser {

    func prefixes() -> Set<String> {
        var prefixes: Set<String> = []
        for parser in options {
            let current = parser.prefixes()
            guard current != [] else { return [] }
            prefixes.formUnion(current)
        }
        return prefixes
    }

    func parse(using scanner: Scanner) throws {
        var diagnostics = [DiagnosticError]()

        scanner.enterNode()
        defer { scanner.exitNode() }

        let prefix = try scanner.prefix(maxPrefixLength)
        let options = prefix.map { parsers(for: $0) } ?? self.options

        var emptyParsers = [InternalParser]()

        let index = scanner.range.lowerBound
        for option in options {
            scanner.begin()
            do {
                try scanner.parse(using: option)

                if Parsed.self == Void.self, scanner.range.lowerBound <= index {
                    emptyParsers.append(option)
                    try scanner.rollback()
                    continue
                }

                try scanner.commit()
                return
            } catch let error as DiagnosticError {
                diagnostics.append(error)
                try scanner.rollback()
            } catch {
                diagnostics.append(AnnotatedError(range: scanner.locationOfNode(), error: error))
                try scanner.rollback()
            }
        }

        for option in emptyParsers {
            try scanner.parse(using: option)
            return
        }

        if let diagnosticError = diagnostics.max(by: { $0.location < $1.location }) {
            scanner.store(error: diagnosticError)
            throw diagnosticError
        }
    }

}

extension Either {

    func parsers(for prefix: Substring) -> [InternalParser] {
        var usedParsers = [Int]()
        var alreadyUsed = Set<Int>()
        var parsers = [InternalParser]()
        
        if !prefix.isEmpty {
            for numberOfCharacters in (1...prefix.count).reversed() {
                guard let map = prefixMap[numberOfCharacters],
                      let indices = map[String(prefix[prefix.startIndex..<prefix.index(prefix.startIndex, offsetBy: numberOfCharacters)])] else {

                    continue
                }

                for index in indices where !alreadyUsed.contains(index) {
                    parsers.append(options[index])
                    alreadyUsed.formUnion([index])
                    usedParsers.append(index)
                }
            }
        }

        for index in fallbackParsers where !alreadyUsed.contains(index) {
            if let indexForInsertion = usedParsers.firstIndex(where: { $0 > index }) {
                parsers.insert(options[index], at: indexForInsertion)
                usedParsers.insert(index, at: indexForInsertion)
            } else {
                parsers.append(options[index])
            }
            alreadyUsed.formUnion([index])
        }

        return parsers
    }

}
