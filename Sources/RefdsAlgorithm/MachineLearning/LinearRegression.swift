import Foundation
import Accelerate

public class LinearRegression {
    private var features: [[NSNumber]]
    private var targets: [NSNumber]
    private var coefficients: [Double] = []
    
    private let semaphore = DispatchSemaphore(value: 0)
    private let queue = DispatchQueue(
        label: "refds.algorithm.linearRegression",
        qos: .background
    )
    
    public init(
        features: [[NSNumber]],
        targets: [NSNumber]
    ) {
        self.features = features
        self.targets = targets
        
        queue.async { self.makeCoefficients() }
    }
    
    private func makeCoefficients() {
        self.coefficients = []
        let rows = features.count
        
        guard let cols = features[safe: 0]?.count,
              rows == targets.count,
              !features.isEmpty && !features[0].isEmpty
        else {
            semaphore.signal()
            return
        }

        var X = features
        for i in 0 ..< rows { X[i].insert(1.0, at: 0) }

        let flatX = X.flatMap { $0 }.map { $0.doubleValue }
        let flatY = targets.map { $0.doubleValue }
        var coefficients = [Double](repeating: 0.0, count: cols + 1)
        
        var XT = [Double](repeating: 0.0, count: rows * (cols + 1))
        vDSP_mtransD(flatX, 1, &XT, 1, vDSP_Length(cols + 1), vDSP_Length(rows))

        var XTX = [Double](repeating: 0.0, count: (cols + 1) * (cols + 1))
        vDSP_mmulD(XT, 1, flatX, 1, &XTX, 1, vDSP_Length(cols + 1), vDSP_Length(cols + 1), vDSP_Length(rows))

        var N = __CLPK_integer(cols + 1)
        var pivots = [__CLPK_integer](repeating: 0, count: cols + 1)
        var workspace = [Double](repeating: 0.0, count: cols + 1)
        var error: __CLPK_integer = 0
        
        let _ = withUnsafeMutablePointer(to: &N) {
            dgetrf_($0, $0, &XTX, $0, &pivots, &error)
        }
        
        guard error == 0 else {
            semaphore.signal()
            return
        }
        
        let _ = withUnsafeMutablePointer(to: &N) {
            dgetri_($0, &XTX, $0, &pivots, &workspace, $0, &error)
        }
        
        guard error == 0 else {
            semaphore.signal()
            return
        }

        var XTY = [Double](repeating: 0.0, count: cols + 1)
        vDSP_mmulD(XT, 1, flatY, 1, &XTY, 1, vDSP_Length(cols + 1), 1, vDSP_Length(rows))
        vDSP_mmulD(XTX, 1, XTY, 1, &coefficients, 1, vDSP_Length(cols + 1), 1, vDSP_Length(cols + 1))

        self.coefficients = coefficients
        semaphore.signal()
    }

    public func predict(for features: [NSNumber]) -> Double? {
        semaphore.wait()
        guard !coefficients.isEmpty,
              var prediction = coefficients[safe: 0]
        else { return nil }
        
        for i in features.indices {
            if let coefficient = coefficients[safe: i + 1] {
                prediction += coefficient * features[i].doubleValue
            }
        }
        semaphore.signal()
        return prediction
    }
}
