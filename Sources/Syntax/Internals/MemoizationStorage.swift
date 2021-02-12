
import Foundation

final class MemoizationStorage {
    private var dictionary: [MemoizationKey : MemoizedState]

    convenience init() {
        self.init(dictionary: [:])
    }

    private init(dictionary: [MemoizationKey : MemoizedState]) {
        self.dictionary = dictionary
    }

    subscript(key: MemoizationKey) -> MemoizedState? {
        get {
            return dictionary[key]
        }
        set {
            dictionary[key] = newValue
        }
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func applyingDifference<T>(text: String, difference: Cache<T>.CacheEntryDifference) -> MemoizationStorage {
        var newDictionary: [MemoizationKey : MemoizedState] = dictionary

        for change in difference.difference {
            switch change {
            case .insert(let offset, _, _):
                let index = text.index(text.startIndex, offsetBy: offset)

                let keys = Array(newDictionary.keys)
                if index >= difference.text.endIndex {
                    for key in keys {
                        let state = newDictionary[key]!
                        var range = state.range
                        if state.range.upperBound == difference.text.endIndex {
                            range = range.lowerBound..<text.endIndex
                        }
                        if state.range.lowerBound == difference.text.endIndex {
                            range = text.endIndex..<text.endIndex
                        }
                        newDictionary[key] = MemoizedState(range: range, node: state.node, values: state.values, ids: state.ids)
                    }
                } else {
                    for key in keys {
                        if key.start >= index {
                            let newKey = MemoizationKey(id: key.id, start: text.index(after: key.start))
                            let state = newDictionary[key]!
                            let range = text.index(after: state.range.lowerBound)..<text.index(after: state.range.lowerBound)
                            newDictionary[key] = nil
                            newDictionary[newKey] = MemoizedState(range: range, node: state.node, values: state.values, ids: state.ids)
                        } else if newDictionary[key]!.range.lowerBound >= index {
                            newDictionary[key] = nil
                        }
                    }
                }
            case .remove(let offset, _, _):
                let index = text.index(text.startIndex, offsetBy: offset)
                let keys = Array(newDictionary.keys)
                for key in keys {
                    if key.start >= index {
                        let newKey = MemoizationKey(id: key.id, start: text.index(before: key.start))
                        let state = newDictionary[key]!
                        let range = text.index(before: state.range.lowerBound)..<text.index(before: state.range.lowerBound)
                        newDictionary[key] = nil
                        newDictionary[newKey] = MemoizedState(range: range, node: state.node, values: state.values, ids: state.ids)
                    } else if newDictionary[key]!.range.lowerBound >= index {
                        newDictionary[key] = nil
                    }
                }
            }
        }

        return MemoizationStorage(dictionary: newDictionary)
    }
}
