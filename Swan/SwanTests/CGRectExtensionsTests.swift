//
//  CGRectExtensionsTest.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import CoreGraphics
import XCTest

class CGRectExtensionTests: XCTestCase {
    
    func testShorthands() {
        let r = CGRect(5, 10, 15, 10)
        XCTAssertTrue(r.x == 5 && r.y == 10 && r.width == 15 && r.height == 10)
    }
    
}

