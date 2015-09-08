//
//  DebugExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 08/09/15.
//
//

import Foundation
import AVFoundation

extension AVCaptureVideoOrientation: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        switch self {
        case .Portrait:
            return "Portrait"
        case .PortraitUpsideDown:
            return "PortraitUpsideDown"
        case .LandscapeLeft:
            return "LandscapeLeft"
        case .LandscapeRight:
            return "LandscapeRight"
        }
    }
    
}

extension UIInterfaceOrientation: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        switch self {
        case .Portrait:
            return "Portrait"
        case .PortraitUpsideDown:
            return "PortraitUpsideDown"
        case .LandscapeLeft:
            return "LandscapeLeft"
        case .LandscapeRight:
            return "LandscapeRight"
        case .Unknown:
            return "Unknown"
        }
    }
    
}

extension UIDeviceOrientation: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        switch self {
        case .Portrait:
            return "Portrait"
        case .PortraitUpsideDown:
            return "PortraitUpsideDown"
        case .LandscapeLeft:
            return "LandscapeLeft"
        case .LandscapeRight:
            return "LandscapeRight"
        case .FaceUp:
            return "FaceUp"
        case .FaceDown:
            return "FaceDown"
        case .Unknown:
            return "Unknown"
        }
    }
    
}
