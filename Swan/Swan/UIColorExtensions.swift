//
//  UIColorExtension.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation

public extension UIColor {
    
    convenience init?(var hex: String) {
        if (hex.hasPrefix("#")) {
            hex = hex.substringFromIndex(hex.startIndex.advancedBy(1));
        }
        
        var r: UInt64 = 0
        var g: UInt64 = 0
        var b: UInt64 = 0
        
        let scanner = NSScanner(string: hex)
        var value: UInt64 = 0
        if hex.utf8.count == 6 && scanner.scanHexLongLong(&value) {
            r = (value & 0xFF0000) >> 16
            g = (value & 0x00FF00) >> 8
            b = (value & 0x0000FF)
            
            self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1.0)
        } else {
            self.init()
            return nil
        }
    }
    
    final var rgba: [CGFloat] {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return [r, g, b, a]
    }
    
    final var red: CGFloat {
        return rgba[0]
    }
    
    final var red8: UInt8 {
        return UInt8(self.red * 255)
    }
    
    final var green: CGFloat {
        return rgba[1]
    }
    
    final var green8: UInt8 {
        return UInt8(self.green * 255)
    }
    
    final var blue: CGFloat {
        return rgba[2]
    }
    
    final var blue8: UInt8 {
        return UInt8(self.blue * 255)
    }
    
    final var alpha: CGFloat {
        return rgba[3]
    }
    
    final var alpha8: UInt8 {
        return UInt8(self.alpha * 255)
    }
    
}
