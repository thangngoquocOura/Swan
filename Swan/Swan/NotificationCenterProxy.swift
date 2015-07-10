//
//  NotificationCenterProxy.swift
//  Swan
//
//  Created by Antti Laitala on 09/07/15.
//
//

import Foundation

public final class NotificationCenterProxy {
    
    public init() { }
    
    public func observe(name: String?, object: AnyObject?, closure: (NSNotification) -> ()) -> String {
        let token = NSUUID().UUIDString
        let observer = NSNotificationCenter.defaultCenter().addObserverForName(name, object: object, queue: nil) { note in
            closure(note)
        }
        observers[token] = observer
        return token
    }
    
    public func observeOnce(name: String?, object: AnyObject?, closure: (NSNotification) -> ()) -> String {
        let token = NSUUID().UUIDString
        let observer = NSNotificationCenter.defaultCenter().addObserverForName(name, object: object, queue: nil) {
            [unowned self] note in
            self.removeObserver(observerToken: token)
            closure(note)
        }
        observers[token] = observer
        return token
    }
    
    public func removeObserver(observerToken token: String) {
        if let observer = observers[token] {
            NSNotificationCenter.defaultCenter().removeObserver(observer)
            observers[token] = nil
        }
    }
    
    // MARK: Private
    
    private var observers = [String: NSObjectProtocol]()
    
    deinit {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        for observer in observers.values {
            notificationCenter.removeObserver(observer)
        }
    }
    
}
