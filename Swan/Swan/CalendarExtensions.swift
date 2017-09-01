//
//  NSCalendarExtension.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation

public extension Calendar {
    
    public static func mainThreadSharedCalendar() -> Calendar {
        assert(Thread.current == Thread.main, "mainThreadSharedCalendar() can only be used in the main thread but it was called from another thread named `\(String(describing: Thread.current.name))!`")
        struct Singleton {
            static let instance = Calendar.current
        }
        return Singleton.instance
    }
    
}
