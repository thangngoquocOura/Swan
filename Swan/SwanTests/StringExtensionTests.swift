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
        XCTAssert("漢字".md2() == "ffb6323c301d329a82032ad213aff0da")
        XCTAssert("漢字".md4() == "a7484867af95076f23d1bf3776ae37c7")
        XCTAssert("漢字".md5() == "3817a0e701ec589ed75b4b1a01398747")
        XCTAssert("漢字".sha1() == "50008262c76205f015248f124c87b9fe463ead9f")
        XCTAssert("漢字".sha224() == "bbb3ba591e557bf7c432f11ef087188d2501a75317b8cb3d26395926")
        XCTAssert("漢字".sha256() == "c6d297713595d2f5127b438aa2ec2cb3049bb096cff7fe128f620a609c32a00f")
        XCTAssert("漢字".sha384() == "218f3158440ec4144e223e0feec139db2004a27f4cfbbff5f7f428b8787e2306fb001430f0957ba94c5631f8f2dece15")
        XCTAssert("漢字".sha512() == "bdb254558fa95a87b7671f7c9f5bfe0f91f6adbe7186b71a73dab1ef696a57617b993ef060f1fef6e426c07237df0ead9df8fc1acf86eb75afd36d528cb105a3")
    }

}
