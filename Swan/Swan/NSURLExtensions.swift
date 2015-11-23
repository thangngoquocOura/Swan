//
//  NSURLExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/11/15.
//
//

import Foundation

extension NSURL {
    
    /// Returns the query items of the URL as a dictionary.
    public final var queryItemsDict: [String: String?] {
        var dict = [String: String?]()
        guard let comps = NSURLComponents(URL: self, resolvingAgainstBaseURL: false), items = comps.queryItems else {
            return dict
        }
        items.forEach {
            dict[$0.name] = $0.value
        }
        return dict
    }
    
}
