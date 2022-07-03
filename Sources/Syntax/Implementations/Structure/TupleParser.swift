
import Foundation

public struct TupleParser<Parsed>: Parser {
    let builders: [InternalParserBuilder]
    let outputTypes: [Any.Type]

    public var body: any Parser<Parsed> {
        return neverBody()
    }
}

extension TupleParser: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let parsers: [InternalParser]
        let outputTypes: [Any.Type]

        init(parsers: [InternalParser], outputTypes: [Any.Type]) {
            self.parsers = parsers
            self.outputTypes = outputTypes
        }

        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return .higher
        }

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
                    var newPrefixes: Set<String> = prefixes
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
            try scanner.withNewNode { scanner in
                for parser in parsers {
                    try scanner.parse(using: parser)
                }

                guard outputTypes.count > 1 else {
                    return
                }

                let outputPointer = UnsafeMutablePointer<Parsed>.allocate(capacity: 1)
                let record = ProtocolConformanceRecord(type: outputTypes[0], witnessTable: nil)
                let firstType = unsafeBitCast(record, to: ValuePopper.Type.self)
                try firstType.pop(from: scanner, into: outputPointer, followedBy: outputTypes.dropFirst())
                scanner.store(value: outputPointer.pointee)
                outputPointer.deallocate()
            }
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(parsers: builders.map { context.build(using: $0) }, outputTypes: outputTypes)
    }
}

private struct ProtocolConformanceRecord {
    let type: Any.Type
    let witnessTable: UnsafeRawPointer?
}

private protocol ValuePopper { }
extension ValuePopper {
    static func pop<T : Collection>(from scanner: Scanner, into pointer: UnsafeMutableRawPointer, followedBy next: T) throws where T.Element == Any.Type {
        var byteOffsetNeeded = (MemoryLayout<Self>.alignment - Int(UInt(bitPattern: pointer))) % MemoryLayout<Self>.alignment
        if byteOffsetNeeded < 0 {
            byteOffsetNeeded += MemoryLayout<Self>.alignment
        }

        let pointer = pointer.advanced(by: byteOffsetNeeded)

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
