
import Foundation

fileprivate let badChars = CharacterSet.alphanumerics.inverted

extension String {
    func nameComponents() -> [String] {
        let basics = replacingOccurrences(of: "([a-z])([A-Z])",
                                          with: "$1 $2",
                                          options: .regularExpression)

        let complete = basics.replacingOccurrences(of: "([A-Z]+)([A-Z][a-z]|$)",
                                                   with: "$1 $2",
                                                   options: .regularExpression)

        return complete.components(separatedBy: badChars)
    }
}
