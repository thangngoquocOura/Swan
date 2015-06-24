//
//  CGFloatConvertible.swift
//  Swan
//
//  Created by Antti Laitala on 23/06/15.
//
//

import Foundation

public protocol CGFloatConvertible {
    
    func CGFloatValue() -> CGFloat
    
}

extension Int: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension Int8: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension Int16: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension Int32: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension Int64: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension UInt: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension UInt8: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension UInt16: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension UInt32: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension UInt64: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension Float: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}

extension Double: CGFloatConvertible {
    
    public func CGFloatValue() -> CGFloat {
        return CGFloat(self)
    }
    
}
