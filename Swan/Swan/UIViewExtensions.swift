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
    
    final func snapshotAfterScreenUpdates(_ afterScreenUpdates: Bool) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
        drawHierarchy(in: bounds, afterScreenUpdates: afterScreenUpdates)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

    final var x: CGFloat {
        get {
            return frame.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    final var y: CGFloat {
        get {
            return frame.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    final var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    final var height: CGFloat {
        get {
            return frame.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
}
