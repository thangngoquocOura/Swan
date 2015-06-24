//
//  CGRectExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import CoreGraphics

public extension CGRect {
    
    var x: CGFloat {
        get {
            return origin.x
        }
    }
    
    var y: CGFloat {
        get {
            return origin.y
        }
    }
    
}
