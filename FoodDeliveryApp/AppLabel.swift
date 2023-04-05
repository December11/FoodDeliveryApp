// AppLabel.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

struct FontStyle {
    /// 13, regular
    static let subtitle = UIFont.systemFont(ofSize: 13)
    /// 13, bold
    static let title13 = UIFont.systemFont(ofSize: 13, weight: .bold)
    /// 16, bold
    static let title16 = UIFont.systemFont(ofSize: 16, weight: .bold)
    /// 17, bold
    static let title17 = UIFont.systemFont(ofSize: 17, weight: .semibold)
}

final class AppLabel: UILabel {
    init(
        title: String? = "",
        alignment: NSTextAlignment = .left,
        style: UIFont,
        fontColor: UIColor? = Colors.textMain,
        numberLines: Int = 1
    ) {
        super.init(frame: .zero)
        text = title
        font = style
        textAlignment = alignment
        textColor = fontColor
        numberOfLines = numberLines
    }

    required init?(coder: NSCoder) { nil }
}
