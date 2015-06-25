//
//  NSLocaleExtension.swift
//  Swan
//
//  Created by Antti Laitala on 25/06/15.
//
//

import Foundation

public extension NSLocale {
    
    final class func appLocale() -> NSLocale {
        if let localization = NSBundle.mainBundle().preferredLocalizations.first {
            return NSLocale(localeIdentifier:localization)
        } else {
            return NSLocale.currentLocale()
        }
    }
    
}
