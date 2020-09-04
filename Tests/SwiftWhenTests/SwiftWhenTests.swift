import XCTest
@testable import SwiftWhen

final class SwiftWhenTests: XCTestCase {
    func testWhenStatement() {
        func getCondition() -> Bool {
          XCTFail("This method should not be called")
          return true
        }
        func getResult() -> String {
          XCTFail("This method should not be called")
          return "result4"
        }
        let result = when {
          false => "result1"
          true => "result2"
          true => { "result3" }
          getCondition() => getResult()
        }
        XCTAssertEqual(result, "result2")
    }

    func testWhenStatement_nilCase() {
        let num = 10
        let result = when {
          num < 0 => "negative"
          num == 0 => "zero"
        }
        XCTAssertNil(result)

        let result2 = when {
          num < 0 => "negative"
          num == 0 => "zero"
        } ?? "positive"
        XCTAssertEqual(result2, "positive")
    }

    static var allTests = [
        ("testWhenStatement", testWhenStatement),
        ("testWhenStatement_nilCase", testWhenStatement_nilCase)
    ]
}
