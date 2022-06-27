
import Foundation
@_exported import SyntaxTree

public final class Cache<T> {
    struct CacheEntry {
        let text: String
        let value: T
        let tree: SyntaxTree
        let storage: MemoizationStorage
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    struct CacheEntryDifference {
        let text: String
        let difference: CollectionDifference<String.Element>
    }

    private var storage: [String : CacheEntry]
    private var usedKeys: OrderedSet<String>
    private let capacity: Int

    var internalParser: InternalParser?

    public init(capacity: Int = 64) {
        self.storage = [:]
        self.usedKeys = []
        self.capacity = capacity
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func storage(for text: String) -> MemoizationStorage {
        let differences = storage.map { (diff: CacheEntryDifference(text: $0.value.text, difference: text.difference(from: $0.value.text)), storage: $0.value.storage) }
        let minTuple = differences
            .filter { $0.diff.difference.count < text.count / 3 } // if more than a third of the text is changed, there's no need to try to cache anything
            .min { left, right in
                return left.diff.difference.count < right.diff.difference.count
            }

        guard let (difference, storage) = minTuple else {
            return MemoizationStorage()
        }

        return storage.applyingDifference(text: text, difference: difference)
    }

    func memory(for text: String) -> CacheEntry? {
        guard let entry = storage[text] else {
            return nil
        }

        usedKeys.remove(text)
        usedKeys.append(text)
        return entry
    }

    func store(entry: CacheEntry) {
        usedKeys.remove(entry.text)
        usedKeys.append(entry.text)
        storage[entry.text] = entry

        while usedKeys.count > capacity {
            evictLeastRecentlyUsed()
        }
    }

    private func evictLeastRecentlyUsed() {
        let leastRecentlyUsed = usedKeys.removeFirst()
        storage[leastRecentlyUsed] = nil
    }
}
