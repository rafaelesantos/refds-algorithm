import Foundation
import RefdsShared

public class Queue<T> {
    private var elements: [T?] = []
    private var head = 0
    
    public var isEmpty: Bool { count == 0 }
    public var count: Int { elements.count - head }
    
    public var front: T? {
        guard !isEmpty else { return nil }
        return elements[head]
    }
    
    public init(elements: [T?] = []) {
        self.elements = elements
    }
    
    public func enqueue(_ element: T) { elements.append(element) }
    
    @discardableResult
    public func dequeue() -> T? {
        guard
            head < elements.count,
            let element = elements[head] else { return nil }
        
        elements[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(elements.count)
        if elements.count > 50 && percentage > 0.25 {
            elements.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

extension Queue: RefdsLogger {
    public func logger() {
        var message = "Queue is empty."
        guard !elements.isEmpty else { return loggerInstance.info(message: message) }
        message = elements.compactMap { $0 }.map { "\($0)" }.joined(separator: ", ")
        loggerInstance.info(message: message)
    }
}
