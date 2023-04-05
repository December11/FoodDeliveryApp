// UITableView+Reusable.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

extension UITableView {
    func cell<T: ReusableCellIdentifiable>(forRowAt indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as? T
    }

    func cell<T: ReusableCellIdentifiable>(forClass cellClass: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T
    }

    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass.self, forCellReuseIdentifier: cellClass.cellIdentifier)
    }
}

extension UITableViewCell: ReusableCellIdentifiable {}

extension ReusableCellIdentifiable where Self: UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}
