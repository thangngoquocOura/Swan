//
//  StringExtensionsTests.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import Swan
import XCTest

class StringExtensionsTests: XCTestCase {
    
    func testReplace() {
        var result = try! "foo bar foo".gsub("^foo", replacement: "")
        XCTAssert(result == " bar foo")
        result = try! "foo bar foo".gsub("^foo|foo$", replacement: "")
        XCTAssert(result == " bar ")
        result = try! "Foo bar FOO".gsub("(?i:^foo|foo$)", replacement: "")
        XCTAssert(result == " bar ")
        
        result = try! "foo FOO bar BAR baz BAZ".gsub("(\\w+)") {
            match in
            if match == "FOO" {
                return "_"
            } else if match == "baz" {
                return "."
            }
            return match
        }
        XCTAssert(result == "foo _ bar BAR . BAZ")
    }
    
    func testMatches() {
        let string = "foo bar foo"
        var result = try! string.match(".")
        XCTAssert(result.count == string.count && result.joined(separator: "") == string)
        XCTAssert(try! string.match("Foo").isEmpty)
        result = try! string.match("(f|b)")
        XCTAssert(result.count == 3 && result[0] == "f" && result[1] == "b" && result[2] == "f")
        
        let html = "<   br  /> < br > breaking news: <br/><BR>This<b >is</b> <> <i>a test<  /i > > <BR />:>"
        var matches = try! html.match("(?i:<(?!\\s*br\\s*/?\\s*>)[^<>]+>)")
        print(matches)
        XCTAssert(matches.count == 4 && matches[0] == "<b >" && matches[1] == "</b>" && matches[2] == "<i>" && matches[3] == "<  /i >")
        
        matches = try! html.match("(?i:(<\\s*br\\s*[/]?\\s*>))")
        XCTAssert(matches.count == 5 && matches[0] == "<   br  />" && matches[1] == "< br >" && matches[2] == "<br/>" && matches[3] == "<BR>" && matches[4] == "<BR />")
    }

}
