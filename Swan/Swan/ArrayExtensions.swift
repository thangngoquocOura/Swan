//
//  ArrayExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 10/07/15.
//
//

import Foundation

public extension Collection where Iterator.Element == UInt8 {
    
    func hex(format: String = "0x%02X", separator: String = " ") -> String {
        let byteFormat = format as NSString
        return map { NSString(format: byteFormat, $0) as String }.joined(separator: separator)
    }
    
}

public extension Collection where Index == Int {
    
    /// Returns a random element from the array, or `nil` if the array is empty.
    func random() -> Iterator.Element? {
        if isEmpty { return nil }
        return self[Int(arc4random_uniform(UInt32(count)))]
    }
    
}

public extension Array where Element: Equatable {
    
    @discardableResult
    mutating func remove(_ object: Element) -> Element? {
        if let index = firstIndex(of: object) {
            return self.remove(at: index)
        }
        return nil
    }
    
}
