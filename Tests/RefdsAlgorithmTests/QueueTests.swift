import XCTest
@testable import RefdsAlgorithm

final class QueueTests: XCTestCase {
    func testInitWithEmptyValuesShouldCompletesWithEmptyValues() {
        let sut = Queue<Int>()
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
    }
    
    func testInitWithValidValuesShoudCompletesWithValidValues() {
        let sut = Queue<Int>(elements: [1, 2, 3])
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 3)
    }
    
    func testEnqueueValidValuesShouldCompletesWithSameValidValues() {
        let sut = Queue<Int>()
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        XCTAssertEqual(sut.front, nil)
        sut.enqueue(10)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 1)
        XCTAssertEqual(sut.front, 10)
        sut.enqueue(20)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 2)
        XCTAssertEqual(sut.front, 10)
        sut.enqueue(30)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 3)
        XCTAssertEqual(sut.front, 10)
    }
    
    func testDequeueValidValuesShouldCompletesWithEmptyValues() {
        let sut = Queue<Int>()
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        XCTAssertEqual(sut.front, nil)
        sut.enqueue(10)
        sut.enqueue(20)
        sut.enqueue(30)
        XCTAssertEqual(sut.dequeue(), 10)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 2)
        XCTAssertEqual(sut.front, 20)
        
        XCTAssertEqual(sut.dequeue(), 20)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 1)
        XCTAssertEqual(sut.front, 30)
        
        XCTAssertEqual(sut.dequeue(), 30)
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        XCTAssertEqual(sut.front, nil)
        XCTAssertEqual(sut.dequeue(), nil)
    }
    
    func testLagerRandomValidValuesShouldCompletesWithEmptyValues() {
        let sut = Queue<Int>()
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        (1 ... 10_000).map { _ in Int.random(in: 5 ... 500) }.forEach {
            sut.enqueue($0)
        }
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 10_000)
        (1 ... 10_000).forEach { _ in sut.dequeue() }
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
    }
    
    func testLogShouldCompletesWithEmptyMessage() {
        let sut = Queue<Int>()
        sut.logger()
    }
    
    func testLogShouldCompletesWithValidMessage() {
        let sut = Queue<Int>()
        sut.enqueue(10)
        sut.enqueue(20)
        sut.enqueue(30)
        sut.logger()
    }
}
