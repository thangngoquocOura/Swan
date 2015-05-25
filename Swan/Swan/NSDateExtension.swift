//
//  NSDateExtension.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation

// MARK: Comparable

extension NSDate: Comparable { }

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.timeIntervalSinceDate(rhs) < 0
}

// MARK: Arithmetic
/*
extension NSDate {
    
    public var second: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.CalendarUnitSecond, fromDate: self)
    }
    
    public var minute: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.CalendarUnitMinute, fromDate: self)
    }
    
    public var hour: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.CalendarUnitHour, fromDate: self)
    }
    
    public var day: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.CalendarUnitDay, fromDate: self)
    }
    
    public var month: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.CalendarUnitMonth, fromDate: self)
    }
    
    public var year: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.CalendarUnitYear, fromDate: self)
    }
    
    public func midnight() -> NSDate {
        let calendar = NSCalendar.sharedCalendar()
        let comps = calendar.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: self)
        return calendar.dateFromComponents(comps)!
    }
    
}

public class TimeUnit {
    
    let unit: NSCalendarUnit
    let duration: Int
    
    init(_ unit: NSCalendarUnit, duration: Int) {
        self.unit = unit
        self.duration = duration
    }
    
}

public func +(lhs: NSDate, rhs: TimeUnit) -> NSDate {
    return NSCalendar.sharedCalendar().dateByAddingUnit(rhs.unit, value: rhs.duration, toDate: lhs, options: .allZeros)!
}

public func +=(inout lhs: NSDate, rhs: TimeUnit) {
    lhs = NSCalendar.sharedCalendar().dateByAddingUnit(rhs.unit, value: rhs.duration, toDate: lhs, options: .allZeros)!
}

public func -(lhs: NSDate, rhs: TimeUnit) -> NSDate {
    return NSCalendar.sharedCalendar().dateByAddingUnit(rhs.unit, value: -rhs.duration, toDate: lhs, options: .allZeros)!
}

public func -=(inout lhs: NSDate, rhs: TimeUnit) {
    lhs = NSCalendar.sharedCalendar().dateByAddingUnit(rhs.unit, value: -rhs.duration, toDate: lhs, options: .allZeros)!
}

extension Int {
    
    public var seconds: TimeUnit {
        return TimeUnit(.CalendarUnitSecond, duration: self)
    }
    
    public var minutes: TimeUnit {
        return TimeUnit(.CalendarUnitMinute, duration: self)
    }
    
    public var hours: TimeUnit {
        return TimeUnit(.CalendarUnitHour, duration: self)
    }
    
    public var days: TimeUnit {
        return TimeUnit(.CalendarUnitDay, duration: self)
    }
    
    public var months: TimeUnit {
        return TimeUnit(.CalendarUnitMonth, duration: self)
    }
    
    public var years: TimeUnit {
        return TimeUnit(.CalendarUnitYear, duration: self)
    }
    
}
*/
