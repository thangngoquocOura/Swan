//
//  Extensions.swift
//  Swan
//
//  Created by Antti Laitala on 10/04/15.
//
//

import Foundation

// MARK: NSLocale

public extension NSLocale {

    /// Returns the preferred locale taking into account device locale settings and supported application localizations.
    class func preferredLocale() -> NSLocale {
        let preferredLanguages = NSLocale.preferredLanguages()
        let preferredLocalizations = NSBundle.mainBundle().localizations
        for preferredLanguage in preferredLanguages {
            if preferredLocalizations.contains(preferredLanguage) {
                return NSLocale(localeIdentifier: preferredLanguage)
            }
        }
        return NSLocale.currentLocale()
    }
    
}

// MARK: CGSize

public extension CGSize {
    
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }

}

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

public func / (lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width / rhs.width, height: lhs.height / rhs.height)
}

public func / (lhs: CGSize, rhs: Double) -> CGSize {
    return CGSize(width: Double(lhs.width) / rhs, height: Double(lhs.height) / rhs)
}
