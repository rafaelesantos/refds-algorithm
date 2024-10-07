import Foundation
import RefdsShared

public actor Stack<T> {
    private var elements: [T] = []
    
    public var isEmpty: Bool { elements.isEmpty }
    
    public var count: Int { elements.count }
    
    public var top: T? { elements.last }
    
    public func push(_ element: T) { elements.append(element) }
    
    @discardableResult
    public func pop() -> T? { elements.popLast() }
}

extension Stack: RefdsLogger {
    public func logger() async {
        var message = "Stack is empty."
        guard !elements.isEmpty else { return await Self.loggerInstance.info(message: message) }
        message = elements.reversed().map { "\($0)" }.joined(separator: ", ")
        await Self.loggerInstance.info(message: message)
    }
}
