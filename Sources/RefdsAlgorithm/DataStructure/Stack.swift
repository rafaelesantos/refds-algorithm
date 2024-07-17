import Foundation
import RefdsShared

public class Stack<T> {
    private var elements: [T] = []
    
    public var isEmpty: Bool { elements.isEmpty }
    
    public var count: Int { elements.count }
    
    public var top: T? { elements.last }
    
    public init(elements: [T] = []) {
        elements.forEach { push($0) }
    }
    
    public func push(_ element: T) { elements.append(element) }
    
    @discardableResult
    public func pop() -> T? { elements.popLast() }
}

extension Stack: RefdsLogger {
    public func logger() {
        var message = "Stack is empty."
        guard !elements.isEmpty else { return Self.loggerInstance.info(message: message) }
        message = elements.reversed().map { "\($0)" }.joined(separator: ", ")
        Self.loggerInstance.info(message: message)
    }
}
