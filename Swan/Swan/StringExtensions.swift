//
//  StringExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation

public extension String {

    /// Returns the uppercase representation of this string taking into account the current app locale.
    var upcase: String {
        return uppercased(with: Locale.appLocale())
    }
    
    /// Returns the downcase representation of this string taking into account the current app locale.
    var downcase: String {
        return lowercased(with: Locale.appLocale())
    }
    
    /// Returns a string object containing the characters of the `String` that lie within a given range.
    subscript(subRange: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: subRange.lowerBound)
        let end = index(startIndex, offsetBy: subRange.upperBound)
        return String(self[start..<end])
    }

    /// Returns a string object containing the characters of the `String` that lie within a given range.
    subscript(subRange: NSRange) -> String {
        let start = index(startIndex, offsetBy: subRange.lowerBound)
        let end = index(startIndex, offsetBy: subRange.upperBound)
        return String(self[start..<end])
    }

    /// Remove the indicated `subRange` of characters.
    ///
    /// Invalidates all indices with respect to `self`.
    ///
    /// - Complexity: O(`self.count`).
    /// - Returns: String that was removed
    mutating func removeRange(_ subRange: Range<Int>) -> String {
        let removed = self[subRange]
        removeSubrange(index(startIndex, offsetBy: subRange.lowerBound)..<index(startIndex, offsetBy: subRange.upperBound))
        return removed
    }
    
}

// MARK: Regex

public extension String {
    
    func match(_ pattern: String) throws -> [String] {
        let regexp = try createRegexWithPattern(pattern)
        let matches = regexp.matches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, characters.count))
        var results = [String]()
        for match in matches {
            results.append(self[match.range])
        }
        return results
    }
    
    func gsub(_ pattern: String, replacement: String) throws -> String {
        let regexp = try createRegexWithPattern(pattern)
        return regexp.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, characters.count), withTemplate: replacement)
    }
    
    func gsub(_ pattern: String, replacementClosure: (String) -> (String)) throws -> String {
        let regexp = try createRegexWithPattern(pattern)
        let matches = regexp.matches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, characters.count))
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

    static fileprivate var regexpCache = [String: NSRegularExpression]()

    fileprivate func createRegexWithPattern(_ pattern: String) throws -> NSRegularExpression {
        var regexp: NSRegularExpression? = String.regexpCache[pattern]
        if regexp == nil {
            regexp = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options())
            String.regexpCache[pattern] = regexp
        }
        return regexp!
    }
    
}
