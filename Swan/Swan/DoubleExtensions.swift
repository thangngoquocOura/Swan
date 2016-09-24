//
//  DoubleExtension.swift
//  Swan
//
//  Created by Antti Laitala on 03/06/15.
//
//

import Foundation

// MARK: CGFloatConvertible Operators

public func +(lhs: Double, rhs: CGFloatConvertible) -> Double {
    return lhs + Double(rhs.CGFloatValue())
}

public func +=(lhs: inout Double, rhs: CGFloatConvertible) {
    lhs += Double(rhs.CGFloatValue())
}

public func -(lhs: Double, rhs: CGFloatConvertible) -> Double {
    return lhs - Double(rhs.CGFloatValue())
}

public func -=(lhs: inout Double, rhs: CGFloatConvertible) {
    lhs -= Double(rhs.CGFloatValue())
}

public func *(lhs: Double, rhs: CGFloatConvertible) -> Double {
    return lhs * Double(rhs.CGFloatValue())
}

public func *=(lhs: inout Double, rhs: CGFloatConvertible) {
    lhs *= Double(rhs.CGFloatValue())
}

public func /(lhs: Double, rhs: CGFloatConvertible) -> Double {
    return lhs / Double(rhs.CGFloatValue())
}

public func /=(lhs: inout Double, rhs: CGFloatConvertible) {
    lhs /= Double(rhs.CGFloatValue())
}
