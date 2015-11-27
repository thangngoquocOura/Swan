//
//  ArrayExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 10/07/15.
//
//

import Foundation

public extension CollectionType where Generator.Element == UInt8 {
    
    final func hex(format format: String = "0x%02X", separator: String = " ") -> String {
        let byteFormat = format as NSString
        return map { NSString(format: byteFormat, $0) as String }.joinWithSeparator(separator)
    }
    
}

public extension CollectionType where Index.Distance == Int {
    
    /// Returns a random element from the collection.
    public final var randomElement: Self.Generator.Element {
        let idx = Int(arc4random_uniform(UInt32(count)))
        return self[startIndex.advancedBy(idx)]
    }
    
}

public extension Array where Element: Equatable {
    
    public mutating func remove(object: Element) -> Element? {
        if let index = indexOf(object) {
            return removeAtIndex(index)
        }
        return nil
    }
    
}
