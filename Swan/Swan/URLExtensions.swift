//
//  URLExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 22/11/15.
//
//

import Foundation

extension URL {
    
    /// Returns the query items of the URL as a dictionary.
    public var queryItemsDict: [String: String?] {
        var dict = [String: String?]()
        guard let comps = URLComponents(url: self, resolvingAgainstBaseURL: false), let items = comps.queryItems else {
            return dict
        }
        items.forEach {
            dict[$0.name] = $0.value
        }
        return dict
    }
    
}
