import Foundation

class LinearRegression {
    private var x: [Double]
    private var y: [Double]
    
    public init(x: [Double], y: [Double]) {
        self.x = x
        self.y = y
    }
    
    private func average(_ input: [Double]) -> Double {
        return input.reduce(0, +) / Double(input.count)
    }

    private func multiply(_ a: [Double], _ b: [Double]) -> [Double] {
        return zip(a, b).map(*)
    }
    
    public var result: (Double) -> Double {
        let sum1 = average(multiply(x, y)) - average(x) * average(y)
        let sum2 = average(multiply(x, x)) - pow(average(x), 2)
        let slope = sum1 / sum2
        let intercept = average(y) - slope * average(x)
        return { x in intercept + slope * x }
    }
}
