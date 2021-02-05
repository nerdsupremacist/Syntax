
import Foundation

class MemoizationStorage {
    private var dictionary: [MemoizationKey : MemoizedState] = [:]

    subscript(key: MemoizationKey) -> MemoizedState? {
        get {
            return dictionary[key]
        }
        set {
            dictionary[key] = newValue
        }
    }
}
