//
//  DateExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation

// MARK: Helpers

public extension Date {

    var nanosecond: Int {
        return Calendar.mainThreadSharedCalendar().component(.nanosecond, from: self)
    }

    var second: Int {
        return Calendar.mainThreadSharedCalendar().component(.second, from: self)
    }
    
    var minute: Int {
        return Calendar.mainThreadSharedCalendar().component(.minute, from: self)
    }
    
    var hour: Int {
        return Calendar.mainThreadSharedCalendar().component(.hour, from: self)
    }
    
    var day: Int {
        return Calendar.mainThreadSharedCalendar().component(.day, from: self)
    }
    
    var month: Int {
        return Calendar.mainThreadSharedCalendar().component(.month, from: self)
    }
    
    var year: Int {
        return Calendar.mainThreadSharedCalendar().component(.year, from: self)
    }
    
    /// Returns a date set to the start of the day (00:00:00) of this date.
    var startOfDay: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        let comps = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: comps)!
    }
    
    /// Returns a date set to the end of the day (23:59:59) of this date.
    var endOfDay: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        var comps = calendar.dateComponents([.year, .month, .day], from: self)
        comps.hour = 23
        comps.minute = 59
        comps.second = 59
        return calendar.date(from: comps)!
    }

    /// Returns a date set to the start of the month (1st day, 00:00:00) of this date.
    var startOfMonth: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        let comps = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: comps)!
    }

    /// Returns a date set to the end of the month (last day, 23:59:59) of this date.
    var endOfMonth: Date {
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
    var noon: Date {
        let calendar = Calendar.mainThreadSharedCalendar()
        var comps = calendar.dateComponents([.year, .month, .day], from: self)
        comps.hour = 12
        return calendar.date(from: comps)!
    }
    
    /// Returns the zero-indexed weekday component of this date starting on monday in range [0, 6].
    var zeroIndexedWeekdayStartingOnMonday: Int {
        let weekday = Calendar.mainThreadSharedCalendar().component(.weekday, from: self)
        return weekday >= 2 ? weekday - 2 : 6
    }

    /// Returns the number of calendar days between this date and `date`.
    func calendarDaysToDate(_ date: Date) -> Int {
        let calendar = Calendar.mainThreadSharedCalendar()
        var fromDate = Date()
        var toDate = Date()
        var interval: TimeInterval = 0
        _ = calendar.dateInterval(of: .day, start: &fromDate, interval: &interval, for: self)
        _ = calendar.dateInterval(of: .day, start: &toDate, interval: &interval, for: date)
        let comps = calendar.dateComponents([.day], from: fromDate, to: toDate)
        return comps.day!
    }
    
    /// Returns the number of calendar weeks between this date and `date`.
    func calendarWeeksToDate(_ date: Date) -> Int {
        let calendar = Calendar.mainThreadSharedCalendar()
        var fromDate = Date()
        var toDate = Date()
        var interval: TimeInterval = 0
        _ = calendar.dateInterval(of: .day, start: &fromDate, interval: &interval, for: self)
        _ = calendar.dateInterval(of: .day, start: &toDate, interval: &interval, for: date)
        let comps = calendar.dateComponents([.weekOfYear], from: fromDate, to: toDate)
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
