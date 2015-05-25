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
    
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
    
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
