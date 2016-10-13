//
//  NSDateExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation

// MARK: Helpers

public extension Date {

    public var nanosecond: Int {
        return Calendar.mainThreadSharedCalendar().component(.nanosecond, from: self)
    }

    public var second: Int {
        return Calendar.mainThreadSharedCalendar().component(.second, from: self)
    }
    
    public var minute: Int {
        return Calendar.mainThreadSharedCalendar().component(.minute, from: self)
    }
    
    public var hour: Int {
        return Calendar.mainThreadSharedCalendar().component(.hour, from: self)
    }
    
    public var day: Int {
        return Calendar.mainThreadSharedCalendar().component(.day, from: self)
    }
    
    public var month: Int {
        return Calendar.mainThreadSharedCalendar().component(.month, from: self)
    }
    
    public var year: Int {
        return Calendar.mainThreadSharedCalendar().component(.year, from: self)
    }
    
    /// Returns a date set to the start of the day (00:00:00) of this date.
    public var startOfDay: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        let comps = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: comps)!
    }
    
    /// Returns a date set to the end of the day (23:59:59) of this date.
    public var endOfDay: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        var comps = calendar.dateComponents([.year, .month, .day], from: self)
        comps.hour = 23
        comps.minute = 59
        comps.second = 59
        return calendar.date(from: comps)!
    }

    /// Returns a date set to the start of the month (1st day, 00:00:00) of this date.
    public var startOfMonth: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        let comps = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: comps)!
    }

    /// Returns a date set to the end of the month (last day, 23:59:59) of this date.
    public var endOfMonth: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        let dayRange = calendar.range(of: .day, in: .month, for: self)!
        var comps = calendar.dateComponents([.year, .month], from: self)
        comps.day = dayRange.upperBound - dayRange.lowerBound
        comps.hour = 23
        comps.minute = 59
        comps.second = 59
        return calendar.date(from: comps)!
    }

    /// Returns the noon (12:00:00) of this date.
    public var noon: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        var comps = calendar.dateComponents([.year, .month, .day], from: self)
        comps.hour = 12
        return calendar.date(from: comps)!
    }
    
    /// Returns the zero-indexed weekday component of this date starting on monday in range [0, 6].
    public var zeroIndexedWeekdayStartingOnMonday: Int {
        let weekday = Calendar.mainThreadSharedCalendar().component(.weekday, from: self)
        return weekday >= 2 ? weekday - 2 : 6
    }

    /// Returns the number of calendar days between this date and `date`.
    public func calendarDaysToDate(_ date: Date) -> Int {
        let calendar = Calendar.mainThreadSharedCalendar() as NSCalendar
        var fromDate: NSDate?
        var toDate: NSDate?
        calendar.range(of: .day, start: &fromDate, interval: nil, for: self)
        calendar.range(of: .day, start: &toDate, interval: nil, for: date)
        let comps = calendar.components(.day, from: fromDate as! Date, to: toDate as! Date, options: NSCalendar.Options())
        return comps.day!
    }
    
    /// Returns the number of calendar weeks between this date and `date`.
    public func calendarWeeksToDate(_ date: Date) -> Int {
        let calendar = Calendar.mainThreadSharedCalendar() as NSCalendar
        var fromDate: NSDate?
        var toDate: NSDate?
        calendar.range(of: .year, start: &fromDate, interval: nil, for: self)
        calendar.range(of: .year, start: &toDate, interval: nil, for: date)
        let comps = calendar.components(.weekOfYear, from: fromDate as! Date, to: toDate as! Date, options: NSCalendar.Options())
        return comps.weekOfYear!
    }

}

// MARK: Date Arithmetic

public struct TimeUnit {
    
    let unit: Calendar.Component
    let duration: Int
    
    init(_ unit: Calendar.Component, duration: Int) {
        self.unit = unit
        self.duration = duration
    }
    
}

public func +(lhs: Date, rhs: TimeUnit) -> Date {
    return Calendar.mainThreadSharedCalendar().date(byAdding: rhs.unit, value: rhs.duration, to: lhs)!
}

public func +=(lhs: inout Date, rhs: TimeUnit) {
    lhs = Calendar.mainThreadSharedCalendar().date(byAdding: rhs.unit, value: rhs.duration, to: lhs)!
}

public func -(lhs: Date, rhs: TimeUnit) -> Date {
    return Calendar.mainThreadSharedCalendar().date(byAdding: rhs.unit, value: -rhs.duration, to: lhs)!
}

public func -=(lhs: inout Date, rhs: TimeUnit) {
    lhs = Calendar.mainThreadSharedCalendar().date(byAdding: rhs.unit, value: -rhs.duration, to: lhs)!
}
