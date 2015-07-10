//
//  NSCalendarExtension.swift
//  Swan
//
//  Created by Antti Laitala on 22/05/15.
//
//

import Foundation

public extension NSCalendar {
    
    final class func mainThreadSharedCalendar() -> NSCalendar {
        assert(NSThread.currentThread() == NSThread.mainThread(), "mainThreadSharedCalendar() can only be used in the main thread but it was called from another thread named `\(NSThread.currentThread().name)!`")
        struct Singleton {
            static let instance = NSCalendar.currentCalendar()
        }
        return Singleton.instance
    }
    
}
