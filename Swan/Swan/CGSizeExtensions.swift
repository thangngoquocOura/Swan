//
//  CGSizeExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 19/11/15.
//
//

import Foundation

public func +(lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

public func +=(inout lhs: CGSize, rhs: CGSize) {
    lhs.width += rhs.width
    lhs.height += rhs.height
}

public func -(lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
}

public func -=(inout lhs: CGSize, rhs: CGSize) {
    lhs.width -= rhs.width
    lhs.height -= rhs.height
}

public func *(lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
}

public func *(lhs: CGSize, rhs: Double) -> CGSize {
    return CGSize(width: Double(lhs.width) * rhs, height: Double(lhs.height) * rhs)
}

public func /(lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width / rhs.width, height: lhs.height / rhs.height)
}

public func /(lhs: CGSize, rhs: Double) -> CGSize {
    return CGSize(width: Double(lhs.width) / rhs, height: Double(lhs.height) / rhs)
}
