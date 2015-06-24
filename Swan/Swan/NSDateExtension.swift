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

// MARK: Helpers

public extension NSDate {
    
    final var second: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.Second, fromDate: self)
    }
    
    final var minute: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.Minute, fromDate: self)
    }
    
    final var hour: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.Hour, fromDate: self)
    }
    
    final var day: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.Day, fromDate: self)
    }
    
    final var month: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.Month, fromDate: self)
    }
    
    final var year: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.Year, fromDate: self)
    }
    
    final func midnight() -> NSDate {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        let comps = calendar.components([.Year, .Month, .Day], fromDate: self)
        return calendar.dateFromComponents(comps)!
    }
    
    final func noon() -> NSDate {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        let comps = calendar.components([.Year, .Month, .Day], fromDate: self)
        comps.hour = 12
        return calendar.dateFromComponents(comps)!
    }
    
}

// MARK: Date Arithmetic

public struct TimeUnit {
    
    let unit: NSCalendarUnit
    let duration: Int
    
    init(_ unit: NSCalendarUnit, duration: Int) {
        self.unit = unit
        self.duration = duration
    }
    
}

public func +(lhs: NSDate, rhs: TimeUnit) -> NSDate {
    return NSCalendar.mainThreadSharedCalendar().dateByAddingUnit(rhs.unit, value: rhs.duration, toDate: lhs, options: [])!
}

public func +=(inout lhs: NSDate, rhs: TimeUnit) {
    lhs = NSCalendar.mainThreadSharedCalendar().dateByAddingUnit(rhs.unit, value: rhs.duration, toDate: lhs, options: [])!
}

public func -(lhs: NSDate, rhs: TimeUnit) -> NSDate {
    return NSCalendar.mainThreadSharedCalendar().dateByAddingUnit(rhs.unit, value: -rhs.duration, toDate: lhs, options: [])!
}

public func -=(inout lhs: NSDate, rhs: TimeUnit) {
    lhs = NSCalendar.mainThreadSharedCalendar().dateByAddingUnit(rhs.unit, value: -rhs.duration, toDate: lhs, options: [])!
}
