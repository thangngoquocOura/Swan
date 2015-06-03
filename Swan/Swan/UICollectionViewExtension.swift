//
//  UICollectionViewExtension.swift
//  Swan
//
//  Created by Antti Laitala on 03/06/15.
//
//

import Foundation
import UIKit

public extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(cell: T.Type) {
        self.registerClass(cell, forCellWithReuseIdentifier: NSStringFromClass(cell))
    }
    
    func registerSectionHeader<T: UICollectionReusableView>(header: T.Type) {
        self.registerClass(header, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(header))
    }
    
    func registerSectionFooter<T: UICollectionReusableView>(footer: T.Type) {
        self.registerClass(footer, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: NSStringFromClass(footer))
    }
    
    func dequeueCell<T: UICollectionViewCell>(cell: T.Type, forIndexPath indexPath: NSIndexPath!) -> T {
        return self.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(cell), forIndexPath: indexPath) as! T
    }
    
    func dequeueSectionHeader<T: UICollectionReusableView>(header: T.Type, forIndexPath indexPath: NSIndexPath!) -> T {
        return self.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier:NSStringFromClass(header), forIndexPath: indexPath) as! T
    }
    
    func dequeueSectionFooter<T: UICollectionReusableView>(footer: T.Type, forIndexPath indexPath: NSIndexPath!) -> T {
        return self.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier:NSStringFromClass(footer), forIndexPath: indexPath) as! T
    }

}
