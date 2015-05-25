//
//  StringExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import SwanBridge

// MARK: Hashing

public extension String {
    
    func md2() -> String {
        return (self as NSString).digestUsingHashFunction(.MD2)
    }
    
    func md4() -> String {
        return (self as NSString).digestUsingHashFunction(.MD4)
    }
    
    func md5() -> String {
        return (self as NSString).digestUsingHashFunction(.MD5)
    }
    
    func sha1() -> String {
        return (self as NSString).digestUsingHashFunction(.SHA1)
    }
    
    func sha224() -> String {
        return (self as NSString).digestUsingHashFunction(.SHA224)
    }
    
    func sha256() -> String {
        return (self as NSString).digestUsingHashFunction(.SHA256)
    }
    
    func sha384() -> String {
        return (self as NSString).digestUsingHashFunction(.SHA384)
    }
    
    func sha512() -> String {
        return (self as NSString).digestUsingHashFunction(.SHA512)
    }
    
}
