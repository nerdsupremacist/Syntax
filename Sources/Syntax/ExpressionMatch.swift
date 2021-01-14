
import Foundation

public struct ExpressionMatch {
    public struct CaptureGroup {
        fileprivate let source: String

        public let range: Range<String.Index>

        public var text: Substring {
            return source[range]
        }
    }

    private let source: String
    private let match: NSTextCheckingResult
    public let range: Range<String.Index>

    public var text: Substring {
        return source[range]
    }

    init(source: String, match: NSTextCheckingResult) {
        self.source = source
        self.match = match
        self.range = Range(match.range, in: source)!
    }

    public subscript(_ index: Int) -> CaptureGroup? {
        guard index < match.numberOfRanges else { return nil }
        let range = match.range(at: index)
        return Range(range, in: source).map { CaptureGroup(source: source, range: $0) }
    }
}
