
import Foundation

struct TupleParser<Output>: Parser {
    let parsers: [InternalParser]
    let outputTypes: [Any.Type]

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension TupleParser: InternalParser {
    func prefixes() -> Set<String> {
        var prefixes: Set<String> = []

        for parser in parsers {
            let currentPrefixes = parser.prefixes()
            if currentPrefixes.isEmpty {
                return prefixes
            } else if prefixes.isEmpty {
                prefixes = currentPrefixes

                if !currentPrefixes.contains("") {
                    return prefixes
                }
            } else {
                var newPrefixes: Set<String> = []
                for start in prefixes {
                    for end in currentPrefixes {
                        newPrefixes.formUnion([start + end])
                    }
                }
                prefixes = newPrefixes

                if !currentPrefixes.contains("") {
                    return prefixes
                }
            }
        }

        return prefixes
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        for parser in parsers {
            try parser.parse(using: scanner)
        }

        if Output.self == Void.self {
            return
        }

        let outputPointer = UnsafeMutablePointer<Output>.allocate(capacity: 1)
        let record = ProtocolConformanceRecord(type: outputTypes[0], witnessTable: nil)
        let firstType = unsafeBitCast(record, to: ValuePopper.Type.self)
        try firstType.pop(from: scanner, into: outputPointer, followedBy: outputTypes.dropFirst())
        scanner.store(value: outputPointer.pointee)
        outputPointer.deallocate()
        scanner.exitNode()
    }
}

private struct ProtocolConformanceRecord {
    let type: Any.Type
    let witnessTable: UnsafeRawPointer?
}

private protocol ValuePopper { }
extension ValuePopper {

    static func pop<T : Collection>(from scanner: Scanner, into pointer: UnsafeMutableRawPointer, followedBy next: T) throws where T.Element == Any.Type {
        if let nextType = next.first {
            let record = ProtocolConformanceRecord(type: nextType, witnessTable: nil)
            let type = unsafeBitCast(record, to: ValuePopper.Type.self)
            if Self.self == Void.self {
                try type.pop(from: scanner, into: pointer, followedBy: next.dropFirst())
            } else {
                try type.pop(from: scanner, into: pointer.advanced(by: MemoryLayout<Self>.stride), followedBy: next.dropFirst())
            }
        }

        if Self.self != Void.self {
            let value = try scanner.pop(of: Self.self)
            _ = Unmanaged.passRetained(value as AnyObject)
            pointer.storeBytes(of: value, as: Self.self)
        }
    }
}
