import Foundation
import XCTest

extension XCTestCase {
    func iterateTestingCondition(condition: @auto_closure () -> LogicValue, expectation: XCTestExpectation?) {
        weak var weakExpectation = expectation
        
        if condition().getLogicValue() {
            weakExpectation?.fulfill()
        } else if weakExpectation {
            let delay = 0.05 * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            let queue = dispatch_get_main_queue()
            dispatch_after(time, queue) {
                self.iterateTestingCondition(condition, expectation: weakExpectation)
            }
        }
    }
    
    func expectationWithCondition(condition: @auto_closure () -> LogicValue) -> XCTestExpectation {
        let expectation = expectationWithDescription("expectationWithCondition:")
        iterateTestingCondition(condition, expectation: expectation);
        return expectation
    }
}
