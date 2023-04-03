// UICollectionView+Reusable.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

protocol ReusableCellIdentifiable {
    static var cellIdentifier: String { get }
}

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(cellClass.self, forCellWithReuseIdentifier: cellClass.cellIdentifier)
    }

    func cell<T: ReusableCellIdentifiable>(forRowAt indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.cellIdentifier, for: indexPath) as? T
    }

    func cell<T: ReusableCellIdentifiable>(forClass cellClass: T.Type, _ indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.cellIdentifier, for: indexPath) as? T
    }
}

extension UICollectionViewCell: ReusableCellIdentifiable {}

extension ReusableCellIdentifiable where Self: UICollectionViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}
