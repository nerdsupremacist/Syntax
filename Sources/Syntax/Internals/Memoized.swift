
import Foundation

struct MemoizedState {
    var range: Range<String.Index>
    var node: Node
    var values: Stack
    var ids: Set<UUID>
    var lastDiagnosticError: DiagnosticError? = nil
}
