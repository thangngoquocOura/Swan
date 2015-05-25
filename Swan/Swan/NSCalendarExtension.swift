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
        NSThread.currentThread()
//        assert(NSThread.currentThread() == NSThread.mainThread(), "mainThreadSharedCalendar() can only be used in the main thread but it was called from another thread named `\(NSThread.currentThread().name)!`")
        struct Singleton {
            static let instance = NSCalendar.currentCalendar()
        }
        return Singleton.instance
    }
    
    final class func sharedCalendar() -> NSCalendar {
        struct Singleton {
            static var instance = [String: NSCalendar]()
        }
        let name = NSThread.currentThread().name
        if let calendar = Singleton.instance[name] {
            return calendar
        }
        let calendar = NSCalendar.currentCalendar()
        Singleton.instance[name] = calendar
        return calendar
        /*
//        if NSThread.currentThread() == NSThread.mainThread() {
//            return NSCalendar.mainThreadSharedCalendar()
//        }
        let dict = NSThread.currentThread().threadDictionary
        if let calendar = dict["swan_calendar"] as? NSCalendar {
            return calendar
        }
        let calendar = NSCalendar.currentCalendar()
        dict["swan_calendar"] = calendar
        return calendar*/
    }
    
}
