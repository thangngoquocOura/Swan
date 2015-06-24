//
//  UILabelExtension.swift
//  Swan
//
//  Created by Antti Laitala on 03/06/15.
//
//

import Foundation
import UIKit

public extension UILabel {
    
    final func sizeHeightToFit() {
        var frame = self.frame;
        sizeToFit()
        frame.size.height = self.frame.size.height
        self.frame = frame
    }
    
    final func sizeWidthToFit() {
        var frame = self.frame
        sizeToFit()
        frame.size.width = self.frame.size.width
        self.frame = frame
    }

}
