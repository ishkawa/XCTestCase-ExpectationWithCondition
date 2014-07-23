XCTestCase-ExpectationWithCondition
===================================

extension of XCTestCase to create XCTestExpectation which waits for the condition to be fulfilled. 

## Usage

```swift
func testBlockOperation() {
    let queue = NSOperationQueue()
    let operation = NSBlockOperation(block: {
        NSThread.sleepForTimeInterval(1.0)
    })

    queue.addOperation(operation)

    expectationWithCondition(operation.finished)
    waitForExpectationsWithTimeout(10.0, handler: nil)
}
```

