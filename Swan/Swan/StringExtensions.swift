//
//  StringExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import CommonCrypto

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
        return substringWithRange(startIndex.advancedBy(subRange.startIndex)..<startIndex.advancedBy(subRange.endIndex))
    }

    /// Returns a string object containing the characters of the `String` that lie within a given range.
    subscript(subRange: NSRange) -> String {
        return substringWithRange(startIndex.advancedBy(subRange.location)..<startIndex.advancedBy(subRange.location + subRange.length))
    }

    /// Remove the indicated `subRange` of characters.
    ///
    /// Invalidates all indices with respect to `self`.
    ///
    /// - Complexity: O(`self.count`).
    /// - Returns: String that was removed
    mutating func removeRange(subRange: Range<Int>) -> String {
        let removed = self[subRange]
        removeRange(startIndex.advancedBy(subRange.startIndex)..<startIndex.advancedBy(subRange.endIndex))
        return removed
    }
    
}

// MARK: Hashing

public extension String {
    
    func md2() -> String {
        return digestUsingHashFunction(.MD2)
    }
    
    func md4() -> String {
        return digestUsingHashFunction(.MD4)
    }
    
    func md5() -> String {
        return digestUsingHashFunction(.MD5)
    }
    
    func sha1() -> String {
        return digestUsingHashFunction(.SHA1)
    }
    
    func sha224() -> String {
        return digestUsingHashFunction(.SHA224)
    }
    
    func sha256() -> String {
        return digestUsingHashFunction(.SHA256)
    }
    
    func sha384() -> String {
        return digestUsingHashFunction(.SHA384)
    }
    
    func sha512() -> String {
        return digestUsingHashFunction(.SHA512)
    }
    
    private enum HashFunction {
        case MD2, MD4, MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    }
    
    private func digestUsingHashFunction(hashFunction: HashFunction) -> String {
        let digestLength: Int32
        let digestFunction: (data: UnsafePointer<Void>, len: CC_LONG, md: UnsafeMutablePointer<UInt8>) -> UnsafeMutablePointer<UInt8>
        switch hashFunction {
        case .MD2:
            digestLength = CC_MD2_DIGEST_LENGTH
            digestFunction = CC_MD2
        case .MD4:
            digestLength = CC_MD4_DIGEST_LENGTH
            digestFunction = CC_MD4
        case .MD5:
            digestLength = CC_MD5_DIGEST_LENGTH
            digestFunction = CC_MD5
        case .SHA1:
            digestLength = CC_SHA1_DIGEST_LENGTH
            digestFunction = CC_SHA1
        case .SHA224:
            digestLength = CC_SHA224_DIGEST_LENGTH
            digestFunction = CC_SHA224
        case .SHA256:
            digestLength = CC_SHA256_DIGEST_LENGTH
            digestFunction = CC_SHA256
        case .SHA384:
            digestLength = CC_SHA384_DIGEST_LENGTH
            digestFunction = CC_SHA384
        case .SHA512:
            digestLength = CC_SHA512_DIGEST_LENGTH
            digestFunction = CC_SHA512
        }
        
        let data = dataUsingEncoding(NSUTF8StringEncoding)!
        var buffer = Array<UInt8>(count: Int(digestLength), repeatedValue: 0)
        digestFunction(data: data.bytes, len: CC_LONG(data.length), md: &buffer)
        
        var result = ""
        buffer.forEach {
            result += String(format: "%02x", $0)
        }
        return result
    }
    
}

// MARK: Regex

public extension String {
    
    func match(pattern: String) throws -> [String] {
        let regexp = try createRegexWithPattern(pattern)
        let matches = regexp.matchesInString(self, options: NSMatchingOptions(), range: NSMakeRange(0, characters.count))
        var results = [String]()
        for match in matches {
            results.append(self[match.range])
        }
        return results
    }
    
    func gsub(pattern: String, replacement: String) throws -> String {
        let regexp = try createRegexWithPattern(pattern)
        return regexp.stringByReplacingMatchesInString(self, options: NSMatchingOptions(), range: NSMakeRange(0, characters.count), withTemplate: replacement)
    }
    
    func gsub(pattern: String, replacementClosure: (String) -> (String)) throws -> String {
        let regexp = try createRegexWithPattern(pattern)
        let matches = regexp.matchesInString(self, options: NSMatchingOptions(), range: NSMakeRange(0, characters.count))
        var result = ""
        var idx = 0
        for match in matches {
            let replacement = replacementClosure(self[match.range])
            // Insert unmodified content.
            result += self[idx..<match.range.location]
            // Replace modified content.
            result += replacement
            idx = match.range.location + match.range.length
        }
        result += self[idx..<characters.count]
        return result
    }

    static private var regexpCache = [String: NSRegularExpression]()

    private func createRegexWithPattern(pattern: String) throws -> NSRegularExpression {
        var regexp: NSRegularExpression? = String.regexpCache[pattern]
        if regexp == nil {
            regexp = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions())
            String.regexpCache[pattern] = regexp
        }
        return regexp!
    }
    
}

/*
@implementation NSString (Swan)

- (NSString *)digestUsingHashFunction:(SwanHashFunction)hashFunction
{
    unsigned char digest[digestLength];
    const char *bytes = self.UTF8String;
    hashFunctionPtr(bytes, (CC_LONG)strlen(bytes), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:digestLength * 2];
    for (NSUInteger i = 0; i < digestLength; ++i)
    [result appendFormat:@"%02x", digest[i]];
    return result;
}

@end
*/
