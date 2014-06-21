import Foundation

struct _BeGreaterThan<T: Comparable>: Matcher {
    let expectedValue: T

    func matches(actualExpression: Expression<T>) -> (pass: Bool, postfix: String)  {
        let actualValue = actualExpression.evaluate()
        return (actualValue > expectedValue, "be greater than <\(expectedValue)>")
    }
}

func beGreaterThan<T>(expectedValue: T) -> _BeGreaterThan<T> {
    return _BeGreaterThan(expectedValue: expectedValue)
}

func ><T: Comparable>(lhs: Expectation<T>, rhs: T) -> Bool {
    lhs.to(beGreaterThan(rhs))
    return true
}
