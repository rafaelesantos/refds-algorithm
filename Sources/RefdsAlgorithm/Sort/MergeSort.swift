import Foundation

public extension Array {
    mutating func mergeSort(by: (Self.Element, Self.Element) -> Bool) {
        self = self.mergeSorted(by: by)
    }
    
    func mergeSorted(by: (Self.Element, Self.Element) -> Bool) -> [Self.Element] {
        let count = self.count
        var matrix = [self, self]
        var d = 0
        var width = 1
        while width < count {
            var i = 0
            while i < count {
                var j = i
                var left = i
                var right = i + width
                let leftMax = Swift.min(left + width, count)
                let rightMax = Swift.min(right + width, count)
                while left < leftMax && right < rightMax {
                    if by(matrix[d][left], matrix[d][right]) {
                        matrix[1 - d][j] = matrix[d][left]
                        left += 1
                    } else {
                        matrix[1 - d][j] = matrix[d][right]
                        right += 1
                    }
                    j += 1
                }
                while left < leftMax {
                    matrix[1 - d][j] = matrix[d][left]
                    j += 1
                    left += 1
                }
                while right < rightMax {
                    matrix[1 - d][j] = matrix[d][right]
                    j += 1
                    right += 1
                }
                i += width * 2
            }
            width *= 2
            d = 1 - d
        }
        return matrix[d]
    }
}
