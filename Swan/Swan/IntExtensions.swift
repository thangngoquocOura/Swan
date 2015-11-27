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
    public func times(@noescape closure: () -> ()) {
        for _ in 0..<self {
            closure()
        }
    }
    
}

// MARK: TimeUnit

public extension Int {
    
    var seconds: TimeUnit {
        return TimeUnit(.Second, duration: self)
    }
    
    var minutes: TimeUnit {
        return TimeUnit(.Minute, duration: self)
    }
    
    var hours: TimeUnit {
        return TimeUnit(.Hour, duration: self)
    }
    
    var days: TimeUnit {
        return TimeUnit(.Day, duration: self)
    }
    
    var months: TimeUnit {
        return TimeUnit(.Month, duration: self)
    }
    
    var years: TimeUnit {
        return TimeUnit(.Year, duration: self)
    }
    
}
