//
//  StringExtensionsTests.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import XCTest

class StringExtensionsTests: XCTestCase {
    
    func testHashing() {
        XCTAssert("".md2() == "8350e5a3e24c153df2275c9f80692773")
        XCTAssert("".md4() == "31d6cfe0d16ae931b73c59d7e0c089c0")
        XCTAssert("".md5() == "d41d8cd98f00b204e9800998ecf8427e")
        XCTAssert("".sha1() == "da39a3ee5e6b4b0d3255bfef95601890afd80709")
        XCTAssert("".sha224() == "d14a028c2a3a2bc9476102bb288234c415a2b01f828ea62ac5b3e42f")
        XCTAssert("".sha256() == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
        XCTAssert("".sha384() == "38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b")
        XCTAssert("".sha512() == "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e")
        
        XCTAssert("漢字".md2() == "ffb6323c301d329a82032ad213aff0da")
        XCTAssert("漢字".md4() == "a7484867af95076f23d1bf3776ae37c7")
        XCTAssert("漢字".md5() == "3817a0e701ec589ed75b4b1a01398747")
        XCTAssert("漢字".sha1() == "50008262c76205f015248f124c87b9fe463ead9f")
        XCTAssert("漢字".sha224() == "bbb3ba591e557bf7c432f11ef087188d2501a75317b8cb3d26395926")
        XCTAssert("漢字".sha256() == "c6d297713595d2f5127b438aa2ec2cb3049bb096cff7fe128f620a609c32a00f")
        XCTAssert("漢字".sha384() == "218f3158440ec4144e223e0feec139db2004a27f4cfbbff5f7f428b8787e2306fb001430f0957ba94c5631f8f2dece15")
        XCTAssert("漢字".sha512() == "bdb254558fa95a87b7671f7c9f5bfe0f91f6adbe7186b71a73dab1ef696a57617b993ef060f1fef6e426c07237df0ead9df8fc1acf86eb75afd36d528cb105a3")
    }

    class Foo {
        
        dynamic var i = ""
        
    }
    
    func testFoo() {
        
    }

}
