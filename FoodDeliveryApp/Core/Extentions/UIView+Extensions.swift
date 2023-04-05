// UIView+Extensions.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach(addSubview)
    }

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
}
