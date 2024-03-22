import Foundation

extension Collection where Element: Equatable {
    func linearSearchPosition(for value: Element) -> Int? {
        for (index, object) in self.enumerated() where value == object {
            return index
        }
        return nil
    }
    
    func linearSearchIndex(for value: Element) -> Self.Index? {
        self.firstIndex { $0 == value }
    }
}
