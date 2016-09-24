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
        case .portrait:
            return "Portrait"
        case .portraitUpsideDown:
            return "PortraitUpsideDown"
        case .landscapeLeft:
            return "LandscapeLeft"
        case .landscapeRight:
            return "LandscapeRight"
        }
    }
    
}

extension UIInterfaceOrientation: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        switch self {
        case .portrait:
            return "Portrait"
        case .portraitUpsideDown:
            return "PortraitUpsideDown"
        case .landscapeLeft:
            return "LandscapeLeft"
        case .landscapeRight:
            return "LandscapeRight"
        case .unknown:
            return "Unknown"
        }
    }
    
}

extension UIDeviceOrientation: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        switch self {
        case .portrait:
            return "Portrait"
        case .portraitUpsideDown:
            return "PortraitUpsideDown"
        case .landscapeLeft:
            return "LandscapeLeft"
        case .landscapeRight:
            return "LandscapeRight"
        case .faceUp:
            return "FaceUp"
        case .faceDown:
            return "FaceDown"
        case .unknown:
            return "Unknown"
        }
    }
    
}
