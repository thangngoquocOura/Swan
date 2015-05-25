//
//  IntExtension.swift
//  Swan
//
//  Created by Antti Laitala on 25/05/15.
//
//

import Foundation

// MARK: TimeUnit

public extension Int {
    
    var seconds: TimeUnit {
        return TimeUnit(.CalendarUnitSecond, duration: self)
    }
    
    var minutes: TimeUnit {
        return TimeUnit(.CalendarUnitMinute, duration: self)
    }
    
    var hours: TimeUnit {
        return TimeUnit(.CalendarUnitHour, duration: self)
    }
    
    var days: TimeUnit {
        return TimeUnit(.CalendarUnitDay, duration: self)
    }
    
    var months: TimeUnit {
        return TimeUnit(.CalendarUnitMonth, duration: self)
    }
    
    var years: TimeUnit {
        return TimeUnit(.CalendarUnitYear, duration: self)
    }
    
}
