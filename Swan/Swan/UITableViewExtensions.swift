//
//  UITableViewExtensions.swift
//  Swan
//
//  Created by Antti Laitala on 16/06/15.
//
//

import Foundation
import UIKit

public extension UITableView {
    
    final func registerCell<T: UITableViewCell>(cell: T.Type) {
        registerClass(cell, forCellReuseIdentifier: NSStringFromClass(cell))
    }
    
    final func registerHeaderFooterView<T: UITableViewHeaderFooterView>(header: T.Type) {
        registerClass(header, forHeaderFooterViewReuseIdentifier: NSStringFromClass(header))
    }
    
    final func dequeueCell<T: UITableViewCell>(cell: T.Type, forIndexPath indexPath: NSIndexPath!) -> T {
        return dequeueReusableCellWithIdentifier(NSStringFromClass(cell), forIndexPath: indexPath) as! T
    }
    
    final func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(header: T.Type) -> T {
        return dequeueReusableHeaderFooterViewWithIdentifier(NSStringFromClass(header)) as! T
    }
    
}
