//
//  ExtensionsTests.swift
//  Swan
//
//  Created by Antti Laitala on 18/05/15.
//
//

import Foundation
import XCTest
import Swan

class ExtensionsTests : XCTestCase {
    
    func testUIColor() {
        var color = UIColor(hex: "#ffffff")!
        XCTAssert(color.red8 == 255 && color.green8 == 255 && color.blue8 == 255 && color.alpha8 == 255)
        color = UIColor(hex: "#000000")!
        XCTAssert(color.red8 == 0 && color.green8 == 0 && color.blue8 == 0 && color.alpha8 == 255)
        color = UIColor(hex: "ed02fa")!
        XCTAssert(color.red8 == 237 && color.green8 == 2 && color.blue8 == 250 && color.alpha8 == 255)
        
        XCTAssertNil(UIColor(hex: ""))
        XCTAssertNil(UIColor(hex: "foo"))
        XCTAssertNil(UIColor(hex: "# deadbeef"))

        var rgba = UIColor.blackColor().rgba
        XCTAssert(rgba[0] == 0 && rgba[1] == 0 && rgba[2] == 0 && rgba[3] == 1)
        rgba = UIColor.clearColor().rgba
        XCTAssert(rgba[0] == 0 && rgba[1] == 0 && rgba[2] == 0 && rgba[3] == 0)
        rgba = UIColor.blueColor().colorWithAlphaComponent(0.5).rgba
        XCTAssert(rgba[0] == 0 && rgba[1] == 0 && rgba[2] == 1 && rgba[3] == 0.5)
    }

    func testNSDate() {
        let d1 = NSDate(timeIntervalSince1970: 5000)
        let d2 = NSDate(timeIntervalSince1970: 5001)
        XCTAssert(d1 < d2)
        let d3 = NSDate(timeIntervalSince1970: 5000)
        XCTAssert(d1 == d3)
    }

    func testCGSize() {
        let s1 = CGSize(width: 50, height: 2)
        let s2 = CGSize(width: 20, height: 40)
        XCTAssert(s1 + s2 == CGSize(width: s1.width + s2.width, height: s1.height + s2.height))
        XCTAssert(s1 - s2 == CGSize(width: s1.width - s2.width, height: s1.height - s2.height))
        XCTAssert(s1 * s2 == CGSize(width: s1.width * s2.width, height: s1.height * s2.height))
        XCTAssert(s1 / s2 == CGSize(width: s1.width / s2.width, height: s1.height / s2.height))
        XCTAssert(s1 * 2 == CGSize(width: s1.width * 2, height: s1.height * 2))
        XCTAssert(s1 / 2 == CGSize(width: s1.width / 2, height: s1.height / 2))
        var s3 = s1
        s3 += s2
        XCTAssert(s3.width == s1.width + s2.width && s3.height == s1.height + s2.height)
        s3 -= s2
        XCTAssert(s3.width == s1.width && s3.height == s1.height)
    }
    
    func testCGFloat() {
        let ff: CGFloat = 5
        ff - Int8(5)
        
        let c: CGFloat = 0.5
        let f: Float = 0.5
        let d: Double = 0.5
        let i: Int = -2
        let u: UInt = 2
        
        XCTAssert(c + f == 1.0)
        XCTAssert(c + d == 1.0)
        XCTAssert(c + i == -1.5)
        XCTAssert(c + u == 2.5)
        
        XCTAssert(c - f == 0.0)
        XCTAssert(c - d == 0.0)
        XCTAssert(c - i == 2.5)
        XCTAssert(c - u == -1.5)
        
        XCTAssert(c * f == 0.25)
        XCTAssert(c * d == 0.25)
        XCTAssert(c * i == -1.0)
        XCTAssert(c * u == 1.0)

        XCTAssert(c / f == 1.0)
        XCTAssert(c / d == 1.0)
        XCTAssert(c / i == -0.25)
        XCTAssert(c / u == 0.25)

        var cvar: CGFloat = 0.5
        cvar += f
        XCTAssert(cvar == 1.0)
        cvar += d
        XCTAssert(cvar == 1.5)
        cvar += i
        XCTAssert(cvar == -0.5)
        cvar += u
        XCTAssert(cvar == 1.5)
        
        cvar -= u
        XCTAssert(cvar == -0.5)
        cvar -= i
        XCTAssert(cvar == 1.5)
        cvar -= d
        XCTAssert(cvar == 1.0)
        cvar -= f
        XCTAssert(cvar == 0.5)

        cvar /= f
        XCTAssert(cvar == 1.0)
        cvar /= d
        XCTAssert(cvar == 2.0)
        cvar /= i
        XCTAssert(cvar == -1.0)
        cvar /= u
        XCTAssert(cvar == -0.5)
    
        cvar *= u
        XCTAssert(cvar == -1.0)
        cvar *= i
        XCTAssert(cvar == 2.0)
        cvar *= d
        XCTAssert(cvar == 1.0)
        cvar *= f
        XCTAssert(cvar == 0.5)
    }
    
}
