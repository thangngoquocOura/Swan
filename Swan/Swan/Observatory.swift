//
//  Observatory.swift
//  Swan
//
//  Created by Antti Laitala on 09/07/15.
//
//

import Foundation

public final class Observatory {
    
    public init() { }
    
    public typealias ClosureKVO = () -> ()
    public typealias ClosureNotificationCenter = (Notification) -> ()
    
    /// Registers a closure to receive KVO notifications for the specified key-path relative to the `object`.
    @discardableResult
    public func observe(_ object: NSObject, keyPath: String, closure: @escaping ClosureKVO) -> String {
        let token = createToken()
        kvoProxy.observers[token] = KVOProxy.Observer(object: object, keyPath: keyPath, closure: closure)
        object.addObserver(kvoProxy, forKeyPath: keyPath, options: [.new], context: nil)
        return token
    }

    /// Registers a closure to receive notifications for the specified `name` and `object`.
    @discardableResult
    public func observe(name: Notification.Name?, object: AnyObject?, closure: @escaping ClosureNotificationCenter) -> String {
        let token = createToken()
        let observer = NotificationCenter.default.addObserver(forName: name, object: object, queue: nil) { note in
            closure(note)
        }
        observers[token] = observer
        return token
    }

    /// Registers a closure to receive notifications for the specified `name` and `object`. Notification is automatically removed after the first time it's fired.
    @discardableResult
    public func observeOnce(name: Notification.Name?, object: AnyObject?, closure: @escaping ClosureNotificationCenter) -> String {
        let token = createToken()
        let observer = NotificationCenter.default.addObserver(forName: name, object: object, queue: nil) {
            [unowned self] note in
            self.removeObserverForToken(token)
            closure(note)
        }
        observers[token] = observer
        return token
    }
    
    /// Removes an observer corresponding to `observerToken`.
    public func removeObserverForToken(_ token: String) {
        if let observer = observers[token] {
            NotificationCenter.default.removeObserver(observer)
            observers[token] = nil
        }
        
        if let observer = kvoProxy.observers[token] {
            observer.object.removeObserver(kvoProxy, forKeyPath: observer.keyPath)
            kvoProxy.observers[token] = nil
        }
    }
    
    // MARK: Private
    
    fileprivate lazy var observers = [String: NSObjectProtocol]()
    fileprivate lazy var kvoProxy = KVOProxy()
    
    fileprivate func createToken() -> String {
        return UUID().uuidString
    }
    
    deinit {
        let notificationCenter = NotificationCenter.default
        for observer in observers.values {
            notificationCenter.removeObserver(observer)
        }
    }
    
}

extension Observatory {

    fileprivate class KVOProxy: NSObject {

        fileprivate struct Observer {
            let object: NSObject
            let keyPath: String
            let closure: ClosureKVO
            
            init(object: NSObject, keyPath: String, closure: @escaping ClosureKVO) {
                self.object = object
                self.keyPath = keyPath
                self.closure = closure
            }
        }
        
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
            for observer in observers.values {
                if observer.object == object as? NSObject && keyPath == observer.keyPath {
                    observer.closure()
                }
            }
        }
        
        deinit {
            for observer in observers.values {
                observer.object.removeObserver(self, forKeyPath: observer.keyPath)
            }
        }

        fileprivate lazy var observers = [String: Observer]()
        
    }

}
