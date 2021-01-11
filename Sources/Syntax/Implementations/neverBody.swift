
import Foundation

func neverBody<T>(_ explanation: String? = nil) -> AnyParser<T> {
    fatalError(explanation ?? "Attempted access of a body from an internal parser.")
}
