//
//  NSDateExtensions.swift
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

    final var nanosecond: Int {
        return NSCalendar.mainThreadSharedCalendar().component(.Nanosecond, fromDate: self)
    }

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
    
    /// Returns a date set to the start of the day (00:00:00) of this date.
    final var startOfDay: NSDate {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        let comps = calendar.components([.Year, .Month, .Day], fromDate: self)
        return calendar.dateFromComponents(comps)!
    }
    
    /// Returns a date set to the end of the day (23:59:59) of this date.
    final var endOfDay: NSDate {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        let comps = calendar.components([.Year, .Month, .Day], fromDate: self)
        comps.hour = 23
        comps.minute = 59
        comps.second = 59
        return calendar.dateFromComponents(comps)!
    }

    /// Returns a date set to the start of the month (1st day, 00:00:00) of this date.
    final var startOfMonth: NSDate {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        let comps = calendar.components([.Year, .Month], fromDate: self)
        return calendar.dateFromComponents(comps)!
    }

    /// Returns a date set to the end of the month (last day, 23:59:59) of this date.
    final var endOfMonth: NSDate {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        let dayRange = calendar.rangeOfUnit(.Day, inUnit: .Month, forDate: self)
        let comps = calendar.components([.Year, .Month], fromDate: self)
        comps.day = dayRange.length
        comps.hour = 23
        comps.minute = 59
        comps.second = 59
        return calendar.dateFromComponents(comps)!
    }

    /// Returns the noon (12:00:00) of this date.
    final var noon: NSDate {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        let comps = calendar.components([.Year, .Month, .Day], fromDate: self)
        comps.hour = 12
        return calendar.dateFromComponents(comps)!
    }
    
    /// Returns the zero-indexed weekday component of this date starting on monday in range [0, 6].
    final var zeroIndexedWeekdayStartingOnMonday: Int {
        let weekday = NSCalendar.mainThreadSharedCalendar().component(.Weekday, fromDate: self)
        return weekday >= 2 ? weekday - 2 : 6
    }

    /// Returns the number of calendar days between this date and `date`.
    final func calendarDaysToDate(date: NSDate) -> Int {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        var fromDate: NSDate?
        var toDate: NSDate?
        calendar.rangeOfUnit(NSCalendarUnit.Day, startDate: &fromDate, interval: nil, forDate: self)
        calendar.rangeOfUnit(NSCalendarUnit.Day, startDate: &toDate, interval: nil, forDate: date)
        return calendar.components(NSCalendarUnit.Day, fromDate: fromDate!, toDate: toDate!, options: NSCalendarOptions()).day
    }
    
    /// Returns the number of calendar weeks between this date and `date`.
    final func calendarWeeksToDate(date: NSDate) -> Int {
        let calendar = NSCalendar.mainThreadSharedCalendar()
        var fromDate: NSDate?
        var toDate: NSDate?
        calendar.rangeOfUnit(NSCalendarUnit.WeekOfYear, startDate: &fromDate, interval: nil, forDate: self)
        calendar.rangeOfUnit(NSCalendarUnit.WeekOfYear, startDate: &toDate, interval: nil, forDate: date)
        return calendar.components(NSCalendarUnit.WeekOfYear, fromDate: fromDate!, toDate: toDate!, options: NSCalendarOptions()).weekOfYear
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
