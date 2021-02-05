
import Foundation

struct Stack {
    private class ValueBox<T>: AnyValueBox {
        let value: T

        init(value: T) {
            self.value = value
        }

        override func pop<A>(of type: A.Type) -> A {
            return value as! A
        }
    }

    private class AnyValueBox {
        func pop<A>(of type: A.Type) -> A {
            fatalError("Empty Value")
        }
    }

    private class Storage {
        let previous: Storage?
        private let box: AnyValueBox

        init<T>(previous: Stack.Storage?, value: T) {
            self.previous = previous
            self.box = ValueBox(value: value)
        }

        private init(previous: Stack.Storage?, box: AnyValueBox) {
            self.previous = previous
            self.box = box
        }

        func inserted(into storage: Storage) -> Storage {
            return Storage(previous: previous?.inserted(into: storage) ?? storage, box: box)
        }

        func removed(from storage: Storage) -> Storage {
            if previous === storage {
                return Storage(previous: nil, box: box)
            }

            return Storage(previous: previous?.removed(from: storage), box: box)
        }

        func pop<A>(of type: A.Type) -> A {
            return box.pop(of: type)
        }
    }

    private var storage: Storage?
    private(set) var count: Int

    init() {
        storage = nil
        count = 0
    }

    @inlinable
    mutating func pop<T>(of type: T.Type) -> T? {
        defer {
            count -= 1
            storage = storage?.previous
        }
        return storage?.pop(of: type)
    }

    @inlinable
    mutating func append<T>(_ value: T) {
        count += 1
        storage = Storage(previous: storage, value: value)
    }

    @inlinable
    mutating func append(contentsOf other: Stack) {
        guard let otherStorage = other.storage else { return }
        count += other.count
        guard let storage = storage else {
            self.storage = other.storage
            return
        }

        self.storage = otherStorage.inserted(into: storage)
    }

    mutating func remove(from other: Stack) {
        guard let otherStorage = other.storage else { return }
        storage = storage?.removed(from: otherStorage)
    }
}
