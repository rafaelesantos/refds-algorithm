import XCTest
@testable import RefdsAlgorithm

final class StackTests: XCTestCase {
    func testInitWithEmptyValuesShouldCompletesWithEmptyValues() {
        let sut = Stack<Int>()
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
    }
    
    func testInitWithValidValuesShoudCompletesWithValidValues() {
        let sut = Stack<Int>(elements: [1, 2, 3])
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 3)
    }
    
    func testPushValidValuesShouldCompletesWithSameValidValues() {
        let sut = Stack<Int>()
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        XCTAssertEqual(sut.top, nil)
        sut.push(10)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 1)
        XCTAssertEqual(sut.top, 10)
        sut.push(20)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 2)
        XCTAssertEqual(sut.top, 20)
        sut.push(30)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 3)
        XCTAssertEqual(sut.top, 30)
    }
    
    func testPopValidValuesShouldCompletesWithEmptyValues() {
        let sut = Stack<Int>()
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        XCTAssertEqual(sut.top, nil)
        sut.push(10)
        sut.push(20)
        sut.push(30)
        XCTAssertEqual(sut.pop(), 30)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 2)
        XCTAssertEqual(sut.top, 20)
        
        XCTAssertEqual(sut.pop(), 20)
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 1)
        XCTAssertEqual(sut.top, 10)
        
        XCTAssertEqual(sut.pop(), 10)
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        XCTAssertEqual(sut.top, nil)
        XCTAssertEqual(sut.pop(), nil)
    }
    
    func testLogShouldCompletesWithEmptyMessage() {
        let sut = Stack<Int>()
        sut.logger()
    }
    
    func testLogShouldCompletesWithValidMessage() {
        let sut = Stack<Int>()
        sut.push(10)
        sut.push(20)
        sut.push(30)
        sut.logger()
    }
}
