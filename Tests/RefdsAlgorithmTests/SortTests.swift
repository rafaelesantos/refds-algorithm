import XCTest
@testable import RefdsAlgorithm

final class SortTests: XCTestCase {
    func testMergerSortForSingleElementShouldCompletesWithSorted() {
        var elements = [1]
        elements.mergeSort(by: <)
        XCTAssertTrue(isSorted(elements: elements, by: <))
    }
    
    func testMergerSortForMultipleElementsShouldCompletesWithSorted() {
        var elements = [10, 9, 8, 7, 6]
        elements.mergeSort(by: <)
        XCTAssertTrue(isSorted(elements: elements, by: <))
    }
    
    func testMergerSortForRandomElementsShouldCompletesWithSorted() {
        var elements = (0 ... 100).map { _ in Int.random(in: 5 ... 500) }
        elements.mergeSort(by: <)
        XCTAssertTrue(isSorted(elements: elements, by: <=))
    }
    
    func testMergerSortForLargeRandomElementsShouldCompletesWithSorted() {
        var elements = (0 ... 1_000).map { _ in Int.random(in: 5 ... 500) }
        elements.mergeSort(by: <)
        XCTAssertTrue(isSorted(elements: elements, by: <=))
    }
    
    private func isSorted<T>(elements: [T], by: (T, T) -> Bool) -> Bool {
        for index in elements.indices {
            if index + 1 < elements.count - 1 {
                guard by(elements[index], elements[index + 1]) else { return false }
            }
        }
        return true
    }
}
