# Syntax

Syntax is a SwiftUI-like data-driven parser builder DSL. You use composition and functional programming to implement a top-down LL(n) parser with minimal effort.
The result is a Parser tailor made to fit your desired output model ;)

## Installation
### Swift Package Manager

You can install Syntax via [Swift Package Manager](https://swift.org/package-manager/) by adding the following line to your `Package.swift`:

```swift
import PackageDescription

let package = Package(
    [...]
    dependencies: [
        .package(url: "https://github.com/nerdsupremacist/Syntax.git", from: "0.2.0")
    ]
)
```

## Usage

Syntax allows you to write parsers that perfectly fit the model that you want.
For example, let's say you want to parse the output of [FizzBuzz](https://en.wikipedia.org/wiki/Fizz_buzz). 
With syntax you begin writing your model:

```swift
enum FizzBuzzValue {
    case number(Int)
    case fizz
    case buzz
    case fizzBuzz
}
```

And then you can just write a parser. Parser's in Syntax are structs that return a `body` much like in SwiftUI.

```swift
import Syntax

struct FizzBuzzParser: Parser {
    var body: AnyParser<[FizzBuzzValue]> {
        Repeat {
            Either {
                IntLiteral().map { FizzBuzzValue.number($0) }

                Word("FizzBuzz").map(to: FizzBuzzValue.fizzBuzz)
                Word("Fizz").map(to: FizzBuzzValue.fizz)
                Word("Buzz").map(to: FizzBuzzValue.buzz)
            }
        }
    }
}
```

Let's break that down:

- `Repeat` signals that it should parse multiple values.
- `Either` signals that you expect any of the following options.
- `IntLiteral` will match the next integer literal it sees.
- `Word` will match the word you give it, and only if it exists by itself.
- `map` will map the value of a parser into something else.
- `map(to:)` will map the value to a constant, useful for matching things like keywords.

To use this parser you can call the `parse` function:

```swift
let text = "1 2 Fizz"
let values = FizzBuzzParser().parse(text)
```

### Syntax Tree's

Syntax supports outputing an Abstract Syntax Tree. All nodes in the Syntax Tree are annotated with a kind. The kind will be automatically derived from the name of a parser, but you can also specify it yourself:

```swift
import Syntax

struct FizzBuzzParser: Parser {
    var body: AnyParser<[FizzBuzzValue]> {
        Repeat {
            Either {
                IntLiteral().map { FizzBuzzValue.number($0) }

                Word("FizzBuzz").map(to: FizzBuzzValue.fizzBuzz).kind("keyword.fizzbuzz")
                Word("Fizz").map(to: FizzBuzzValue.fizz).kind("keyword.fizz")
                Word("Buzz").map(to: FizzBuzzValue.buzz).kind("keyword.buzz")
            }
        }
    }
}
```

To get the AST you can ask for it via the `syntaxTree` function:

```swift
let text = "1 2 Fizz"
let tree = FizzBuzzParser().syntaxTree(text)
```

The AST is Encodable, so you can encode it into JSON. For example:

```json
{
  "startLocation": { "line": 0, "column": 0 },
  "kind": "fizz.buzz",
  "startOffset": 0,
  "endLocation": { "line": 0, "column": 8 },
  "endOffset": 8,
  "children": [
    {
      "startLocation": { "line": 0, "column": 0 },
      "kind": "int.literal",
      "startOffset": 0,
      "endLocation": { "line": 0, "column": 1 },
      "endOffset": 1,
      "value": 1
    },
    {
      "startLocation": { "line": 0, "column": 2 },
      "kind": "int.literal",
      "startOffset": 2,
      "endLocation": { "line": 0, "column": 3 },
      "endOffset": 3,
      "value": 2
    },
    {
      "match": "Fizz",
      "startLocation": { "line": 0, "column": 4 },
      "kind": "keyword.fizz",
      "startOffset": 4,
      "endLocation": { "line": 0, "column": 8 },
      "endOffset": 8
    }
  ]
}
```

### Syntax Highlighting

You can use your parser to highlight code on a [Publish](https://github.com/JohnSundell/Publish) Site using this [plugin](https://github.com/nerdsupremacist/syntax-highlight-publish-plugin).


```swift
import SyntaxHighlightPublishPlugin

extension Grammar {
    // define Fizz Buzz Grammar
    static let fizzBuzz = Grammar(name: "FizzBuzz") {
        FizzBuzzParser()
    }
}

try MyPublishSite().publish(using: [
    ...
    // use plugin and include your Grammar
    .installPlugin(.syntaxHighlighting(.fizzbuzz)),
])
```

## Contributions
Contributions are welcome and encouraged!

## License
Syntax is available under the MIT license. See the LICENSE file for more info.
