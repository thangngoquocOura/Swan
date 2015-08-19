//
//  DictionaryExtensionsTests.swift
//  Swan
//
//  Created by Antti Laitala on 19/08/15.
//
//

import Foundation
import Swan
import XCTest

class DictionaryExtensionsTests: XCTestCase {
    
    func testOperators() {
        let d1 = ["foo": 0, "bar": 1]
        let d2 = ["foo": 1, "baz": 2]
        
        let r1 = d1 + d2
        XCTAssert(r1["foo"] == 1 && r1["bar"] == 1 && r1["baz"] == 2)
        XCTAssert(d1["baz"] == nil)
        
        var r2 = d1
        r2 += d2
        XCTAssert(r2 == r1)

        r2 -= d2
        XCTAssert(r2.count == 1 && r2["bar"] == 1)
        
        let r3 = d1 - d2
        XCTAssert(r3 == r2)
    }
    
}
