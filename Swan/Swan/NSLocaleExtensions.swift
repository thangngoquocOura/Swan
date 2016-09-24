//
//  NSLocaleExtension.swift
//  Swan
//
//  Created by Antti Laitala on 25/06/15.
//
//

import Foundation

public extension NSLocale {
    
    final class func appLocale() -> Locale {
        if let localization = Bundle.main.preferredLocalizations.first {
            return Locale(identifier: localization)
        } else {
            return Locale.current
        }
    }
    
    /// Returns the preferred locale taking into account device locale settings and supported application localizations.
    final class func preferredLocale() -> Locale {
        let preferredLanguages = NSLocale.preferredLanguages
        let preferredLocalizations = Bundle.main.localizations
        for preferredLanguage in preferredLanguages {
            if preferredLocalizations.contains(preferredLanguage) {
                return Locale(identifier: preferredLanguage)
            }
        }
        return Locale.current
    }
    
}
