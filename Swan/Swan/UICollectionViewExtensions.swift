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
    
    final func registerCell<T: UICollectionViewCell>(_ cell: T.Type) {
        self.register(cell, forCellWithReuseIdentifier: NSStringFromClass(cell))
    }
    
    final func registerSectionHeader<T: UICollectionReusableView>(_ header: T.Type) {
        self.register(header, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(header))
    }
    
    final func registerSectionFooter<T: UICollectionReusableView>(_ footer: T.Type) {
        self.register(footer, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: NSStringFromClass(footer))
    }
    
    final func dequeueCell<T: UICollectionViewCell>(_ cell: T.Type, forIndexPath indexPath: IndexPath!) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(cell), for: indexPath) as! T
    }
    
    final func dequeueSectionHeader<T: UICollectionReusableView>(_ header: T.Type, forIndexPath indexPath: IndexPath!) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier:NSStringFromClass(header), for: indexPath) as! T
    }
    
    final func dequeueSectionFooter<T: UICollectionReusableView>(_ footer: T.Type, forIndexPath indexPath: IndexPath!) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier:NSStringFromClass(footer), for: indexPath) as! T
    }

}
