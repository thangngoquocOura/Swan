//
//  ArrayExtensionsTests.swift
//  Swan
//
//  Created by Antti Laitala on 10/07/15.
//
//

import Swan
import Foundation
import XCTest

class ArrayExtensionsTests: XCTestCase {
    
    func testHex() {
        let bytes: [UInt8] = [0x30, 0xA5, 0xBC]
        XCTAssert(bytes.hex() == "0x30 0xA5 0xBC")
        XCTAssert(bytes.hex(format: "%02x", separator: ", ") == "30, a5, bc")
    }
    
    func testRandom() {
        XCTAssert([].random() == nil)
        XCTAssert([5].random() == 5)
        let a = [5, 10, 15]
        XCTAssert(a.contains(a.random()!))
    }
    
    func testRemove() {
        var a = [5, 10, 15]
        XCTAssert(a.remove(1) == nil)
        XCTAssert(a.remove(5) == 5)
        XCTAssert(a == [10, 15])
        a.remove(10)
        a.remove(15)
        XCTAssert(a.isEmpty)
    }
    
}
