
import Foundation

public class SyntaxTree: Encodable {
    private struct AnyCodingKey: CodingKey {
        let stringValue: String

        var intValue: Int? {
            return nil
        }

        init(stringValue: String) {
            self.stringValue = stringValue
        }

        init(_ codingKey: CodingKeys) {
            self.init(stringValue: codingKey.rawValue)
        }

        init?(intValue: Int) {
            return nil
        }
    }

    private enum CodingKeys: String, CodingKey, CaseIterable {
        case kind
        case startOffset
        case endOffset
        case startLocation
        case endLocation
        case annotations
        case children

        static let taken: Set<String> = Set(Self.allCases.map(\.rawValue))
    }

    public internal(set) var kind: Kind?
    public let range: Range<Int>
    public let location: Range<Location>
    private var _annotations: [String : AnyEncodable]
    public internal(set) var children: [SyntaxTree]

    public var annotations: [String : Any] {
        return _annotations.mapValues { $0.value }
    }

    init(kind: Kind? = nil,
         range: Range<Int>,
         location: Range<Location>,
         annotations: [String : Encodable],
         children: [SyntaxTree]) {

        self.kind = kind
        self.range = range
        self.location = location
        self._annotations = annotations.mapValues(AnyEncodable.init)
        self.children = children
    }

    func add(annotations: [String : Encodable]) {
        self._annotations.merge(annotations.mapValues(AnyEncodable.init)) { $1 }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(kind, forKey: AnyCodingKey(.kind))
        try container.encode(range.lowerBound, forKey: AnyCodingKey(.startOffset))
        try container.encode(range.upperBound, forKey: AnyCodingKey(.endOffset))
        try container.encode(location.lowerBound, forKey: AnyCodingKey(.startLocation))
        try container.encode(location.upperBound, forKey: AnyCodingKey(.endLocation))
        try container.encode(children, forKey: AnyCodingKey(.children))

        let inlineable = _annotations.filter { !CodingKeys.taken.contains($0.key) }
        let rest = _annotations.filter { CodingKeys.taken.contains($0.key) }

        for (key, value) in inlineable {
            try container.encode(value, forKey: AnyCodingKey(stringValue: key))
        }

        if !rest.isEmpty {
            try container.encode(rest, forKey: AnyCodingKey(.annotations))
        }
    }
}

extension SyntaxTree {

    func prune(using strategy: Kind.CombinationStrategy) {
        children = children.filter { $0.kind != nil || !$0.annotations.isEmpty || !$0.range.isEmpty }

        if children.count == 1 {
            prune(using: children[0], and: strategy)
        }
        
        for child in self.children {
            child.prune(using: .separate)
        }
    }

    fileprivate func prune(using child: SyntaxTree, and strategy: Kind.CombinationStrategy) {
        var newKind: Kind? = kind ?? child.kind
        if let kind = kind, let otherKind = child.kind {
            switch strategy {
            case .separate:
                return child.prune(using: .separate)
            case .higher:
                newKind = kind
            case .lower:
                newKind = otherKind
            }
        }

        guard range == child.range, Set(child._annotations.keys).intersection(_annotations.keys).isEmpty else {
            return child.prune(using: .separate)
        }

        kind = newKind
        children = child.children
        _annotations.merge(child._annotations) { $1 }
        prune(using: strategy)
    }

}
private struct AnyEncodable: Encodable {
    let value: Encodable

    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
