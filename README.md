# Ogma

Ogma is a lightweight Parsing Framework written in Swift. Say goodbye to complicated state machines! Now you can easily write a Parser using only pure functions.

## How do I write a Parser

Once you have an understanding what you want to parse (it helps to have a defined Context Free Grammar already written down), you need to implement:

- **Your Model:** What the result of the Parser should look like
- **Your Lexer:** A component to turn an input String into Tokens
- **Your Parser:** The consumer of the Tokens from the Lexer. The Parser will take the Tokens as an input and output your Model

## Example

Right now, to make it easy we will write a simple calculator using Ogma. Our calculator will only support addition and multiplication. For now we will not be doing multiplication before addition. That's a story for another time.

Let's go back to the Original Idea: Model, Lexer, Parser!

### Model

We can model the input to our calculator as an `Expression`:

```swift
public indirect enum Expression {

    public struct Addition {
        let lhs: Expression
        let rhs: Expression
    }

    public struct Multiplication {
        let lhs: Expression
        let rhs: Expression
    }

    case int(Int)
    case addition(Addition)
    case multiplication(Multiplication)
}
```

While we're at it we might as well just write the classic `eval` function:

```swift
extension Expression {

    func eval() -> Int {
        switch self {
        case .int(let int):
            return int
        case .addition(let lhs, let rhs):
            return lhs.eval() + rhs.eval()
        case .multiplication(let lhs, let rhs):
            return lhs.eval() * rhs.eval()
        }
    }

}
```

### Lexer

First let's define what the Tokens are going to be. So we will allow Integers, `+` and `*`, as well as opening and closing parenthesis.

So our Tokens can now be an enum. For clarity we suggest namespacing the Tokens with your model. To make it clear that they belong together:

```swift
extension Expression {

    public enum Token: TokenProtocol {
        case int(Int)
        case plus
        case times
    }

}
```

With the Tokens clear we can now just write a Lexer. A Lexer is a component that turns a String into Tokens. The easiest way to build one is by using what we call `TokenGenerator`s. A TokenGenerator attempts to consume the beginning of a string as far as it can to create a single Token. 

To use `TokenGenerator`s our Lexer simply has to conform to `GeneratorLexer` and return the generators it will be using:

```swift
extension Expression {

    enum Lexer: GeneratorLexer {
        typealias Token = Expression.Token

        static let generators: Generators = [
                IntLiteralTokenGenerator().map(Token.int),
                RegexTokenGenerator(pattern: "\\+").map(to: .plus),
                RegexTokenGenerator(pattern: "\\*").map(to: .times),
            ]
    }


}
```

Now there's a lot of stuff going on here. We're mainly using two things:

- `IntLiteralTokenGenerator` is a TokenGenerator already implemented by Ogma. It will take a string and attempt to parse an Int. We are then just mapping that generator to return the Tokens we modeled before.
- `RegexTokenGenerator` is a TokenGenerator that will return a String matching the pattern. Then we map every instance to `.plus`.  So if we find a `+` we return `Token.plus`

### Parser

We can now make build our Parser by letting our Model implement `Parsable`. For an Object to be `Parsable` it just means that there's a static Parser that can return the type.
For starters let's implement it for Int. The easiest way is to write a computed property for token, when it has an Int:

```swift
extension Expression.Token {
    var int: Int? {
        guard case .int(let int) = self else { return nil }
        return int
    }
}
```

And give the key path to a parser:

```swift
extension Int: Parsable {
    public typealias Token = Expression.Token

    public static let parser: AnyParser<Expression.Token, Int> = .consuming(keyPath: \.int)
}
```

And now the operations. By using the `&&` operator we can chain multiple Parsers and expect the results sequentially:

```swift
extension Expression.Addition: Parsable {
    public typealias Token = Expression.Token

    public static let parser: AnyParser<Expression.Token, Expression.Addition> = {
        let parser = Int.self && .plus && Expression.self
        return parser.map { Expression.Addition(lhs: .int($0), rhs: $1) }
    }()
}

extension Expression.Multiplication: Parsable {
    public typealias Token = Expression.Token

    public static let parser: AnyParser<Expression.Token, Expression.Multiplication> = {
        let parser = Int.self && .times && Expression.self
        return parser.map { Expression.Multiplication(lhs: .int($0), rhs: $1) }
    }()
}
```

In this scenario we are always expecting the first member of an operation to be an Int. This is to avoid an endless recursion looking like `Expression` -> `Addition` -> `Expression`.

And finally we make the expression `Parsable`. This time using the `||` operator to signal that it should take the result from the first Parser that succeeds:

```swift
extension Expression: Parsable {

    public static let parser: AnyParser<Expression.Token, Expression> = Addition.map(Expression.addition) ||
        Multiplication.map(Expression.multiplication) ||
        Int.map(Expression.int)

}
```

### Profit! 💸

Now we can use our parser:

```swift
extension String {

    func calculate() throws -> Int {
        return try Expression.parse(self, using: Expression.Lexer.self).eval()
    }

}
```

Awesome! We just wrote a calculator and at no point did we use a state machine. In fact all of our functions are completely pure and can easily be extended.

## Other cool features

### Ignoring Tokens

Some languages choose to ignore certain characters and expressions entirely. 
These are Tokens that should never make it to the Parser in the first place. For example: Comments and Whitespaces.

If you already have a TokenGenerator that consumes this, you simply call `ignore` in your Lexer.
For example if we want to ignore Whitespaces in our calculator:

```swift
enum Lexer: GeneratorLexer {
	...

    static let generators: Generators = [
			WhiteSpaceTokenGenerator().ignore(),
			...
		]
}
```


### String Annotation
 
Sometimes you're not expecting all of the user's input to be valid. Maybe you want them to be able to inline your languange inside of some other text. For that there's `AnnotatedString<T>`. An annotated string is actually just an array of the enum:

```swift
public enum AnnotationElement<Annotation> {
    case text(String)
    case annotated(String, Annotation)
}
```

Where it can be some text that wasn't matched of an annotated section with a parsed value.

Now you can support cool features like parsing inlined JSON:

```
Hello, here's some JSON: { "Hello": "World" }
``` 

Which would output:

```swift
[
	.text("Hello, here's some JSON:"),
	.annotated("{ \"Hello\": \"World\" }",
		 	   .dictionary(["Hello": .string("World"])),
]
```

In fact you don't even need a full Parser architecture to enjoy this feature. If you just want to annotate this expressible by a Regular Expression, a Lexer will be enough. 

For example if you're parsing mentions and hashtags in a tweet:

**First:** Build a lexer.

```swift
enum Twitter {

    enum Token: TokenProtocol {
        case mention(String)
        case hashtag(String)
    }

    enum Lexer: GeneratorLexer {
        typealias Token = Twitter.Token

        static let generators: Generators = [
            RegexTokenGenerator(pattern: "@(\\w+)", group: 1).map { .mention($0) },
            RegexTokenGenerator(pattern: "#(\\w+)", group: 1).map { .hashtag($0) },
        ]
    }

}
```

**Second:** Call annotate:

```swift
let tweet = try Twitter.Lexer.annotate(input) as AnnotatedString<Twitter.Token>
```

## Future Topics and Known Issues

- A type can only implement `Parsable` once. And for one type of Tokens. So if you plan on writing more than one parser, you should not let types from the Standard Library implement `Parsable`.
- Indirect enum tend to have the recursion issue mentioned earlier. A call stack based failsafe could be implemented, but it's not yet clear what it should look like.
- Operator precedence does not work out of the box, yet.


## Authors

- [Mathias Quintero](https://github.com/nerdsupremacist)

## Acknowledgements

This project was made possible with the help, supervision and valuable feedback from:

- [Stefan Koffler](https://github.com/grafele)
- [Sebastian Sellmair](https://github.com/sellmair)
- [QuickBird Studios](https://github.com/quickbirdstudios)
