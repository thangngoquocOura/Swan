//
//  DictionaryExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 19/08/15.
//
//

import Foundation

public func +<T, K>(lhs: [T: K], rhs: [T: K]) -> [T: K] {
    var lhs = lhs
    for (k, v) in rhs {
        lhs.updateValue(v, forKey: k)
    }
    return lhs
}

public func +=<T, K>(inout lhs: [T: K], rhs: [T: K]) {
    for (k, v) in rhs {
        lhs.updateValue(v, forKey: k)
    }
}

public func -<T, K>(lhs: [T: K], rhs: [T: K]) -> [T: K] {
    var lhs = lhs
    for (k, _) in rhs {
        lhs[k] = nil
    }
    return lhs
}

public func -=<T, K>(inout lhs: [T: K], rhs: [T: K]) {
    for (k, _) in rhs {
        lhs[k] = nil
    }
}
