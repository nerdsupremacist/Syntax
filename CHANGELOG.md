# Changelog
## [2.0.0] - Unreleased
### Fixed
- Fixed `mapWithLocation` reporting the wrong location.
- Fixed caching not being effective on iOS, watchOS and tvOS. 

### Added
- Added automatic wrapping of errors with the location in code.
- Added property wrapper `Located` that allows you to store a value along with the location in the text where it's read from.
- Binary Operation has all it's values annotated with the location.
- String Escape Strategy mimicking JavaScript.
- **Experimental:** Added support for using [RegexBuilder](https://developer.apple.com/documentation/RegexBuilder) inside of the Syntax DSL.

### Changed
- Updated to Swift 5.4 to ensure we can call our Result Builders, Result Builders.
- Syntax Tree depedency is not exported as an import. So you no longer have to import it if you're reading from the AST.

## [1.0.3] - 2021-02-07
### Fixed
- Fixed memory issue that arose from parsing sequences.

## [1.0.2] - 2021-02-07
### Changed
- Allowing support to be used in other platforms.

## [1.0.1] - 2021-02-07
### Fixed
- Fixed issue with created AST not receiving updates when scanning ahead. 

## [1.0.0] - 2021-02-07
### Changed
- **Breaking:** Refactored API completely to be based on Result Builders. This API no longer requries you to separate your logic into a Tokenizer and a Parser. It's all just parsers now.
- Renamed package to `Syntax`
- Moved to Swift Package Manager

## [0.1.1] - 2019-05-06
### Added
- Added `StringLiteralEscapingStrategy` and `escapingStrategy` argument to `StringLiteralTokenGenerator`, for handling escaped characters in a String Literal
- Added default `SwiftStringLiteralEscapingStrategy` and `JSONStringLiteralEscapingStrategy` for the standard handling for String Literals

## [0.1.0] - 2019-05-06
### Added
- Initial Release
