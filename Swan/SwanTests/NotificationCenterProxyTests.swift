//
//  NotificationCenterProxyTests.swift
//  Swan
//
//  Created by Antti Laitala on 09/07/15.
//
//

import Swan
import XCTest

class NotificationCenterProxyTests: XCTestCase {
    
    let notificationCenter = NSNotificationCenter.defaultCenter()

    private class TestObserver {
        let notificationCenterProxy = NotificationCenterProxy()
        var count = 0
    }
    
    func testObserveOnce() {
        var i = 0
        let notificationCenterProxy = NotificationCenterProxy()
        notificationCenterProxy.observeOnce("once", object: nil) {
            _ in
            i++
        }
        notificationCenter.postNotificationName("once", object: nil)
        XCTAssert(i == 1)
        notificationCenter.postNotificationName("once", object: nil)
        XCTAssert(i == 1)
    }
    
    func testDeinit() {
        var i = 0
        autoreleasepool {
            let observer = TestObserver()
            observer.notificationCenterProxy.observeOnce("once", object: nil) {
                _ in
                i++
            }
            observer.notificationCenterProxy.observe(nil, object: nil) {
                _ in
                i++
            }
            notificationCenter.postNotificationName("", object: nil)
            XCTAssert(i == 1)
        }
        notificationCenter.postNotificationName("once", object: nil)
        XCTAssert(i == 1)
    }
    
    func testRemoveObserver() {
        var i = 0
        let notificationCenterProxy = NotificationCenterProxy()
        let token = notificationCenterProxy.observe(nil, object: nil) {
            _ in
            i++
        }
        notificationCenter.postNotificationName("", object: nil)
        notificationCenter.postNotificationName("", object: nil)
        XCTAssert(i == 2)
        notificationCenterProxy.removeObserver(observerToken: token)
        notificationCenter.postNotificationName("", object: nil)
        XCTAssert(i == 2)
    }
    
}
