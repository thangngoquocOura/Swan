//
//  IntExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 25/05/15.
//
//

import Foundation

public extension Int {

    /// Performs the provided `closure` n times as defined by `self`.
    public func times(_ closure: () -> ()) {
        for _ in 0..<self {
            closure()
        }
    }
    
}

// MARK: TimeUnit

public extension Int {
    
    var seconds: TimeUnit {
        return TimeUnit(.second, duration: self)
    }
    
    var minutes: TimeUnit {
        return TimeUnit(.minute, duration: self)
    }
    
    var hours: TimeUnit {
        return TimeUnit(.hour, duration: self)
    }
    
    var days: TimeUnit {
        return TimeUnit(.day, duration: self)
    }
    
    var months: TimeUnit {
        return TimeUnit(.month, duration: self)
    }
    
    var years: TimeUnit {
        return TimeUnit(.year, duration: self)
    }
    
}
