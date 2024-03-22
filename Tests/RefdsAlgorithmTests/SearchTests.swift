import XCTest
@testable import RefdsAlgorithm

final class SearchTests: XCTestCase {
    func testLinearSearchShouldCompletesWithValidPosition() {
        let elements = [10, 9, 8, 7, 6]
        let expectedPosition = 3
        let receivedPosition = elements.linearSearchPosition(for: 7)
        XCTAssertEqual(expectedPosition, receivedPosition)
    }
    
    func testLinearSearchShouldCompletesWithEmptyPosition() {
        let elements = [10, 9, 8, 7, 6]
        let expectedPosition: Int? = nil
        let receivedPosition = elements.linearSearchPosition(for: 2)
        XCTAssertEqual(expectedPosition, receivedPosition)
    }
    
    func testLinearSearchShouldCompletesWithValidIndex() {
        let elements = [10, 9, 8, 7, 6]
        let expectedIndex = 3
        let receivedIndex = elements.linearSearchIndex(for: 7)
        XCTAssertEqual(expectedIndex, receivedIndex)
    }
    
    func testLinearSearchShouldCompletesWithEmptyIndex() {
        let elements = [10, 9, 8, 7, 6]
        let expectedIndex: Int? = nil
        let receivedIndex = elements.linearSearchIndex(for: 2)
        XCTAssertEqual(expectedIndex, receivedIndex)
    }
}
