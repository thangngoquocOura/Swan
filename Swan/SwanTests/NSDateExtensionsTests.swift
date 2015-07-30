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
        let now = NSDate()
        let midnight = now.midnight()
        var diff = midnight.calendarDaysToDate(now)
        XCTAssert(diff == 0)
        diff = midnight.calendarDaysToDate(midnight - 1.seconds)
        XCTAssert(diff == -1)
        diff = midnight.calendarDaysToDate(midnight + 1.days)
        XCTAssert(diff == 1)
    }
    
}
