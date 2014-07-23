import Foundation
import XCTest

class XCTestCaseExpectationWithConditionTests: XCTestCase {
    func testWaitForSatisfyingCondition() {
        var flag = false
        
        let queue = NSOperationQueue()
        let operation = NSBlockOperation(block: {
            NSThread.sleepForTimeInterval(1.0)
            flag = true
        })
        
        queue.addOperation(operation)
        
        expectationWithCondition(operation.finished)
        waitForExpectationsWithTimeout(10.0, handler: nil)
        
        XCTAssertTrue(flag)
    }
}
