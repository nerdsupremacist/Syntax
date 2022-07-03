
import Foundation
@_exported import SyntaxTree

class Node {
    let originalStart: String.Index
    var start: String.Index
    var parent: Node? = nil
    var children: [MutableSyntaxTree] = []

    init(start: String.Index, parent: Node? = nil) {
        self.originalStart = start
        self.start = start
        self.parent = parent
    }

    func update(from previous: String.Index, to new: String.Index) {
        if start >= previous, start < new {
            start = new
            parent?.update(from: previous, to: new)
        }
    }
}

extension Node {
    func copy() -> Node {
        let node = Node(start: originalStart)
        node.start = start
        node.parent = parent?.copy()
        node.children = Array(children)
        return node
    }
}

extension MutableSyntaxTree {

    fileprivate func copy() -> MutableSyntaxTree {
        return MutableSyntaxTree(range: range, location: location, annotations: annotations, children: children.map { $0.copy() })
    }

}
