//
//  UIViewExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import UIKit

public extension UIView {
    
    var x: CGFloat {
        get {
            return frame.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return frame.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return frame.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
}
