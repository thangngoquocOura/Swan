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
        XCTAssert(bytes.hex(format: "%02x", joiner: ", ") == "30, a5, bc")
    }
    
}
