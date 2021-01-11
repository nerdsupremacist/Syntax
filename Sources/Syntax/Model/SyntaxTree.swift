
import Foundation

public class SyntaxTree: Encodable {
    public internal(set) var kind: Kind?
    public let range: Range<Int>
    public let location: Range<Location>
    public internal(set) var annotations: [String : String]
    public internal(set) var children: [SyntaxTree]

    init(kind: Kind? = nil,
         range: Range<Int>,
         location: Range<Location>,
         annotations: [String : String],
         children: [SyntaxTree]) {

        self.kind = kind
        self.range = range
        self.location = location
        self.annotations = annotations
        self.children = children
    }

    func add(annotations: [String : String]) {
        self.annotations.merge(annotations) { $1 }
    }
}

extension SyntaxTree {

    func prune() {
        children = children.filter { $0.kind != nil || !$0.annotations.isEmpty || !$0.range.isEmpty }

        if children.count == 1 {
            prune(using: children[0])
        }
        
        for child in children {
            child.prune()
        }
    }

    fileprivate func prune(using child: SyntaxTree) {
        if let kind = kind, let otherKind = child.kind, kind != otherKind {
            return child.prune()
        }

        guard range == child.range, Set(child.annotations.keys).intersection(annotations.keys).isEmpty else {
            return child.prune()
        }

        kind = kind ?? child.kind
        children = child.children
        annotations.merge(child.annotations) { $1 }
        prune()
    }

}
