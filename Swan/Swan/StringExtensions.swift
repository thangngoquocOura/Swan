//
//  StringExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import SwanBridge

public extension String {

    /// Returns the uppercase representation of this string taking into account the current app locale.
    var upcase: String {
        return uppercaseStringWithLocale(NSLocale.appLocale())
    }
    
    /// Returns the downcase representation of this string taking into account the current app locale.
    var downcase: String {
        return lowercaseStringWithLocale(NSLocale.appLocale())
    }
    
    /// Returns a string object containing the characters of the `String` that lie within a given range.
    subscript(subRange: Range<Int>) -> String {
        return substringWithRange(Range<Index>(start: advance(startIndex, subRange.startIndex), end: advance(startIndex, subRange.endIndex)))
    }
    
    /// Remove the indicated `subRange` of characters.
    ///
    /// Invalidates all indices with respect to `self`.
    ///
    /// - Complexity: O(`self.count`).
    /// - Returns: String that was removed
    mutating func removeRange(subRange: Range<Int>) -> String {
        let removed = self[subRange]
        removeRange(Range(start: advance(startIndex, subRange.startIndex), end: advance(startIndex, subRange.endIndex)))
        return removed
    }
    
}

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
