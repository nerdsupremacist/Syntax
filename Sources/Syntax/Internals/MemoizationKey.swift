
import Foundation

struct MemoizationKey: Hashable {
    let id: UUID
    let start: String.Index
}
