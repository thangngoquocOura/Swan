//
//  UICollectionViewExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 03/06/15.
//
//

import Foundation
import UIKit

public extension UICollectionView {
    
    final func registerCell<T: UICollectionViewCell>(cell: T.Type) {
        self.registerClass(cell, forCellWithReuseIdentifier: NSStringFromClass(cell))
    }
    
    final func registerSectionHeader<T: UICollectionReusableView>(header: T.Type) {
        self.registerClass(header, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(header))
    }
    
    final func registerSectionFooter<T: UICollectionReusableView>(footer: T.Type) {
        self.registerClass(footer, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: NSStringFromClass(footer))
    }
    
    final func dequeueCell<T: UICollectionViewCell>(cell: T.Type, forIndexPath indexPath: NSIndexPath!) -> T {
        return self.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(cell), forIndexPath: indexPath) as! T
    }
    
    final func dequeueSectionHeader<T: UICollectionReusableView>(header: T.Type, forIndexPath indexPath: NSIndexPath!) -> T {
        return self.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier:NSStringFromClass(header), forIndexPath: indexPath) as! T
    }
    
    final func dequeueSectionFooter<T: UICollectionReusableView>(footer: T.Type, forIndexPath indexPath: NSIndexPath!) -> T {
        return self.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier:NSStringFromClass(footer), forIndexPath: indexPath) as! T
    }

}
