import Foundation

// MARK: - When Expression

/// When expression extends the capability of Ternary conditional operator `?:` to allow multiple conditions are evaluated.
///
/// Example:
///
/// ```
/// let flag1 = false
/// let flag2 = true
/// let flag3 = true
/// let text = when {
///     flag1 => "result1"
///     flag2 => "result2"
///     flag3 => "result3"
/// } // text == Optional.some("result2")
/// ```
///  The order of  components is important. The first component whose condition is resolved as true will be selected, and its result will be returned.
/// - Parameter builder: a function builder that returns a list of components.
public func when<T>(@WhenComponentBuilder _ builder: () -> [WhenComponent<T>]) -> T? {
    builder().first { $0.conditionIsMet }?.result
}

// MARK: - Component

/// The component that is intended to only be used in `when` expression
public struct WhenComponent<Value> {

    private let conditionBuilder: () -> Bool
    private let resultBuilder: () -> Value
    var conditionIsMet: Bool { conditionBuilder() }
    var result: Value { resultBuilder() }

    public init(condition: @escaping () -> Bool, result: @escaping () -> Value) {
        self.conditionBuilder = condition
        self.resultBuilder = result
    }
}

// MARK: - Operator

precedencegroup WhenComponentPrecedence {

    lowerThan: BitwiseShiftPrecedence, MultiplicationPrecedence, AdditionPrecedence, RangeFormationPrecedence, CastingPrecedence, NilCoalescingPrecedence, ComparisonPrecedence, LogicalConjunctionPrecedence, LogicalDisjunctionPrecedence, TernaryPrecedence
    higherThan: AssignmentPrecedence
}

infix operator => : WhenComponentPrecedence

public func => <T>(condition: @autoclosure @escaping () -> Bool, result: @autoclosure @escaping () -> T) -> WhenComponent<T> {
    WhenComponent(condition: condition, result: result)
}

public func => <T>(condition: @autoclosure @escaping () -> Bool, result: @escaping () -> T) -> WhenComponent<T> {
    WhenComponent(condition: condition, result: result)
}

// MARK: - Function Builder

@_functionBuilder
public struct WhenComponentBuilder {

    public static func buildBlock<T>(_ conditions: WhenComponent<T>...) -> [WhenComponent<T>] {
        return conditions
    }
}
