//
//  NSDateExtensionsTests.swift
//  Swan
//
//  Created by Antti Laitala on 30/07/15.
//
//

import Foundation
import XCTest
import Swan

class NSDateExtensionsTests: XCTestCase {
    
    func testCalendarDaysToDate() {
        let now = Date()
        let midnight = now.startOfDay
        var diff = midnight.calendarDaysToDate(now)
        XCTAssert(diff == 0)
        diff = midnight.calendarDaysToDate(midnight - 1.seconds)
        XCTAssert(diff == -1)
        diff = midnight.calendarDaysToDate(midnight + 1.days)
        XCTAssert(diff == 1)
    }
    
    func testStartOfDay() {
        let date = Date()
        let comps = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let startOfDay = date.startOfDay
        XCTAssert(startOfDay.year == comps.year && startOfDay.month == comps.month && startOfDay.day == comps.day && startOfDay.hour == 0 && startOfDay.minute == 0 && startOfDay.second == 0)
    }
    
}
