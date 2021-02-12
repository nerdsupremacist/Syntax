import Foundation

struct OrderedSet<E: Hashable>: Equatable, Collection {
    typealias Element = E
    typealias Index = Int

    public typealias Indices = Range<Int>

    private var array: [Element]
    private var set: Set<Element>

    /// Creates an empty ordered set.
    init() {
        self.array = []
        self.set = Set()
    }

    init(_ array: [Element]) {
        self.init()
        append(contentsOf: array)
    }

    // MARK: Working with an ordered set
    /// The number of elements the ordered set stores.
    var count: Int { return array.count }

    /// Returns `true` if the set is empty.
    var isEmpty: Bool { return array.isEmpty }

    /// Returns the contents of the set as an array.
    var contents: [Element] { return array }

    /// Returns `true` if the ordered set contains `member`.
    func contains(_ member: Element) -> Bool {
        return set.contains(member)
    }

    /// Adds an element to the ordered set.
    ///
    /// If it already contains the element, then the set is unchanged.
    ///
    /// - returns: True if the item was inserted.
    @discardableResult
    mutating func append(_ newElement: Element) -> Bool {
        let inserted = set.insert(newElement).inserted
        if inserted {
            array.append(newElement)
        }
        return inserted
    }

    mutating func append<S: Sequence>(contentsOf sequence: S) where S.Element == Element {
        for element in sequence {
            append(element)
        }
    }

    @discardableResult
    mutating func remove(_ element: Element) -> Element? {
        guard let removed = set.remove(element) else { return nil }
        if let index = array.firstIndex(of: element) {
            array.remove(at: index)
        }
        return removed
    }

    mutating func removeFirst() -> Element {
        let firstElement = array.removeFirst()
        set.remove(firstElement)
        return firstElement
    }

    mutating func removeLast() -> Element {
        let lastElement = array.removeLast()
        set.remove(lastElement)
        return lastElement
    }

    mutating func removeAll(keepingCapacity keepCapacity: Bool) {
        array.removeAll(keepingCapacity: keepCapacity)
        set.removeAll(keepingCapacity: keepCapacity)
    }
}

extension OrderedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

extension OrderedSet: RandomAccessCollection {
    var startIndex: Int { return contents.startIndex }
    var endIndex: Int { return contents.endIndex }
    subscript(index: Int) -> Element {
      return contents[index]
    }
}

func == <T>(lhs: OrderedSet<T>, rhs: OrderedSet<T>) -> Bool {
    return lhs.contents == rhs.contents
}

extension OrderedSet: Hashable where Element: Hashable { }

extension OrderedSet {

    static func + (lhs: OrderedSet<Element>, rhs: Element) -> OrderedSet<Element> {
        var copy = lhs
        copy.append(rhs)
        return copy
    }

    static func + (lhs: OrderedSet<Element>, rhs: OrderedSet<Element>) -> OrderedSet<Element> {
        var copy = lhs
        copy.append(contentsOf: rhs)
        return copy
    }

}
