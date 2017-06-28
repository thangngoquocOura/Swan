//
//  ObservatoryTests.swift
//  Swan
//
//  Created by Antti Laitala on 09/07/15.
//
//

import Swan
import XCTest

class ObservatoryTests: XCTestCase {
    
    let notificationCenter = NotificationCenter.default

    private class TestObserver {
        let observatory = Observatory()
        var count = 0
    }
    
    private class Observable: NSObject {
        @objc dynamic var name = ""
    }

    func testObserveOnce() {
        var i = 0
        let once = Notification.Name("once")
        let notificationCenterProxy = Observatory()
        notificationCenterProxy.observeOnce(name: once, object: nil) {
            _ in
            i += 1
        }
        notificationCenter.post(name: once, object: nil)
        XCTAssert(i == 1)
        notificationCenter.post(name: once, object: nil)
        XCTAssert(i == 1)
    }
    
    func testKVO() {
        let observable = Observable()
        let observatory = Observatory()
        let token = observatory.observe(observable, keyPath: "name") {
            [unowned observable] in
            print("name: \(observable.name)")
            XCTAssert(observable.name == "foo")
        }
        observable.name = "foo"
        observatory.removeObserverForToken(token)
        observable.name = ""
    }
    
    func testDeinit() {
        var i = 0
        let once = Notification.Name("once")
        autoreleasepool {
            let observer = TestObserver()
            observer.observatory.observeOnce(name: once, object: nil) {
                _ in
                i += 1
            }
            observer.observatory.observe(name: nil, object: nil) {
                _ in
                i += 1
            }
            notificationCenter.post(name: Notification.Name(""), object: nil)
            XCTAssert(i == 1)
        }
        notificationCenter.post(name: once, object: nil)
        XCTAssert(i == 1)
        
        let observable = Observable()
        autoreleasepool {
            let obs = Observatory()
            obs.observe(observable, keyPath: "name") {
                fatalError()
            }
        }
        observable.name = "foo"
    }
    
    func testRemoveObserver() {
        var i = 0
        let notificationCenterProxy = Observatory()
        let token = notificationCenterProxy.observe(name: nil, object: nil) {
            _ in
            i += 1
        }
        let empty = Notification.Name("")
        notificationCenter.post(name: empty, object: nil)
        notificationCenter.post(name: empty, object: nil)
        XCTAssert(i == 2)
        notificationCenterProxy.removeObserverForToken(token)
        notificationCenter.post(name: empty, object: nil)
        XCTAssert(i == 2)
    }
    
}
