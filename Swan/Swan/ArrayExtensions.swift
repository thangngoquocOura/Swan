//
//  ArrayExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 10/07/15.
//
//

import Foundation

public extension CollectionType where Generator.Element == UInt8 {
    
    final func hex(format format: String = "0x%02X", joiner: String = " ") -> String {
        let byteFormat = format as NSString
        return joiner.join(map { NSString(format: byteFormat, $0) as String })
    }
    
}
