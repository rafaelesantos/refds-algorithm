import XCTest
@testable import RefdsAlgorithm

final class MachineLearningTests: XCTestCase {
    func testLinearRegressionShouldCompletesWithValidValue() {
        let carAge: [Double] = [10, 8, 3, 3, 2, 1]
        let carPrice: [Double] = [500, 400, 7000, 8500, 11000, 10500]
        let linearRegression = LinearRegression(x: carAge, y: carPrice)
        let result = linearRegression.result(4)
        XCTAssertEqual(Int(result), 6952)
    }
}
