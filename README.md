# SwiftWhen

## What is SwiftWhen?

SwiftWhen is a syntax sugar that imitates the [When Expression in Kotlin](https://kotlinlang.org/docs/reference/control-flow.html#when-expression), as an addition to control flow.

## Example

```swift
let isFreeUser: Bool = ...
let hasEnoughPoints: Bool = ...
let label = when {
    isFreeUser => "Please upgrade to premium user"
    hasEnoughPoints => "Click to redeam"
} ?? "Not enough points"
```

## Installation

SwiftPackageManager

```
dependencies: [
    .package(url: "https://github.com/lionhylra/SwiftWhen.git", .upToNextMajor(from: "1.0.0"))
]
```


## Documentation

When expression allows you to evaluate multiple confitions(boolean values) and map them to a target value. A custom operator `=>` is used to construct a single mapping.

```
Boolean Expression => Value
```

You can put multiple expressions in the `when` function. The evaluation goes from top to bottom. The first map whose condition is true get selected and its value is returned as the return value of `when` function. If a mapping is selected, other mappings after that won't be evaluated.

```
let lastName: String? = ...
let gender: Gender = ...
let greetings = when {
    lastName == nil => "Hi there"
    lastName!.count > 5 => Hi \(lastName!)
    gender == .male => "Hi Mr \(lastName!)"
    gender == .female => "Hi Ms \(lastName!)"
}!
```

`when` expression always return an optional value. If no condition is met, `when` expression returns nil.

```
let num = -1
let text = when {
    num > 0 => "positive"
    num == 0 => "zero"
}
// text == nil
```

In a mapping, you can use bool value, bool expression or a function that returns bool as condition. You can also use a closure as a result value.

```
let n: Int = ...
let text = when {
    n > 0 => "a"
    n == 0 => { "b" }
    n < 0 => { () -> String in 
        let a = "a"
        let b = "b"
        return a + " " + b
    }
}
```
## When to use it

`when` expression should not be used to replace `if` statement or `switch` statement. It can help improve the readability when it requires more lines to write using `if` of `switch`. It is convenient you have more than two conditions where swift ternary conditional operator is not enough, especially when you just want to return a value instead of doing a lot.
