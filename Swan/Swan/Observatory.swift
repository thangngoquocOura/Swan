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
    public typealias ClosureNotificationCenter = (NSNotification) -> ()
    
    /// Registers a closure to receive KVO notifications for the specified key-path relative to the `object`.
    public func observe(object: NSObject, keyPath: String, closure: ClosureKVO) -> String {
        let token = createToken()
        kvoProxy.observers[token] = KVOProxy.Observer(object: object, keyPath: keyPath, closure: closure)
        object.addObserver(kvoProxy, forKeyPath: keyPath, options: [.New], context: nil)
        return token
    }
    
    /// Registers a closure to receive notifications for the specified `name` and `object`.
    public func observe(name: String?, object: AnyObject?, closure: ClosureNotificationCenter) -> String {
        let token = createToken()
        let observer = NSNotificationCenter.defaultCenter().addObserverForName(name, object: object, queue: nil) { note in
            closure(note)
        }
        observers[token] = observer
        return token
    }
    
    /// Registers a closure to receive notifications for the specified `name` and `object`. Notification is automatically removed after the first time it's fired.
    public func observeOnce(name: String?, object: AnyObject?, closure: ClosureNotificationCenter) -> String {
        let token = createToken()
        let observer = NSNotificationCenter.defaultCenter().addObserverForName(name, object: object, queue: nil) {
            [unowned self] note in
            self.removeObserverForToken(token)
            closure(note)
        }
        observers[token] = observer
        return token
    }
    
    /// Removes an observer corresponding to `observerToken`.
    public func removeObserverForToken(token: String) {
        if let observer = observers[token] {
            NSNotificationCenter.defaultCenter().removeObserver(observer)
            observers[token] = nil
        }
        
        if let observer = kvoProxy.observers[token] {
            observer.object.removeObserver(kvoProxy, forKeyPath: observer.keyPath)
            kvoProxy.observers[token] = nil
        }
    }
    
    // MARK: Private
    
    private lazy var observers = [String: NSObjectProtocol]()
    private lazy var kvoProxy = KVOProxy()
    
    private func createToken() -> String {
        return NSUUID().UUIDString
    }
    
    deinit {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        for observer in observers.values {
            notificationCenter.removeObserver(observer)
        }
    }
    
}

extension Observatory {

    private class KVOProxy: NSObject {

        private struct Observer {
            unowned let object: NSObject
            let keyPath: String
            let closure: ClosureKVO
            
            init(object: NSObject, keyPath: String, closure: ClosureKVO) {
                self.object = object
                self.keyPath = keyPath
                self.closure = closure
            }
        }
        
        override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
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

        private lazy var observers = [String: Observer]()
        
    }

}
