//
//  UILabelExtension.swift
//  Swan
//
//  Created by Antti Laitala on 03/06/15.
//
//

import Foundation
import UIKit

extension UILabel {
    
    func sizeHeightToFit() {
        var frame = self.frame;
        self.sizeToFit()
        frame.size.width = self.width
        self.frame = frame
    }
    
}
