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
            return NSLocale(localeIdentifier: localization)
        } else {
            return NSLocale.currentLocale()
        }
    }
    
    /// Returns the preferred locale taking into account device locale settings and supported application localizations.
    final class func preferredLocale() -> NSLocale {
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
