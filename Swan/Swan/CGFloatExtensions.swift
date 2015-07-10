//
//  CGFloatExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation
import CoreGraphics

// MARK: CGFloatConvertible Operators

public func +(lhs: CGFloat, rhs: CGFloatConvertible) -> CGFloat {
    return lhs + rhs.CGFloatValue()
}

public func +=(inout lhs: CGFloat, rhs: CGFloatConvertible) {
    lhs += rhs.CGFloatValue()
}

public func -(lhs: CGFloat, rhs: CGFloatConvertible) -> CGFloat {
    return lhs - rhs.CGFloatValue()
}

public func -=(inout lhs: CGFloat, rhs: CGFloatConvertible) {
    lhs -= rhs.CGFloatValue()
}

public func *(lhs: CGFloat, rhs: CGFloatConvertible) -> CGFloat {
    return lhs * rhs.CGFloatValue()
}

public func *=(inout lhs: CGFloat, rhs: CGFloatConvertible) {
    lhs *= rhs.CGFloatValue()
}

public func /(lhs: CGFloat, rhs: CGFloatConvertible) -> CGFloat {
    return lhs / rhs.CGFloatValue()
}

public func /=(inout lhs: CGFloat, rhs: CGFloatConvertible) {
    lhs /= rhs.CGFloatValue()
}
