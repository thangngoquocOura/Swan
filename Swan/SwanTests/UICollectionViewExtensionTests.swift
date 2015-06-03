//
//  UICollectionViewExtensionTests.swift
//  Swan
//
//  Created by Antti Laitala on 03/06/15.
//
//

import Foundation
import UIKit
import XCTest

class UICollectionViewExtensionTests: XCTestCase {
    
    func testReusability() {
        class Cell: UICollectionViewCell { }
        class Header: UICollectionReusableView { }
        class Footer: UICollectionReusableView { }
        let collectionView = UICollectionView(frame: CGRect(0, 0, 10, 10), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.registerCell(Cell.self)
        collectionView.registerSectionHeader(Header)
        collectionView.registerSectionFooter(Footer)
    }
    
}


