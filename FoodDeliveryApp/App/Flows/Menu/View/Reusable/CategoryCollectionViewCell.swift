// CategoryCollectionViewCell.swift
// Copyright © Alla Shkolnik. All rights reserved.

import SnapKit
import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    private let titleLabel = AppLabel(alignment: .center, style: FontStyle.subtitle, fontColor: Colors.accentMinor)

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }

    func configure(title: String, isSelected: Bool) {
        titleLabel.text = title
        isSelected ? itemWasSelected() : itemWasDeselected()
        configureUI()
    }

    func itemWasSelected() {
        titleLabel.textColor = Colors.textInvert
        titleLabel.font = FontStyle.title13
        contentView.backgroundColor = Colors.accent
    }

    func itemWasDeselected() {
        titleLabel.textColor = Colors.accentMinor
        titleLabel.font = FontStyle.subtitle
        contentView.backgroundColor = Colors.backgroundMinor
        contentView.layer.borderColor = Colors.accentMinor?.cgColor
    }

    private func configureUI() {
        contentView.roundCorners([.allCorners], radius: Constants.inset16)
        contentView.layer.borderWidth = Constants.inset1
        contentView.layer.borderColor = Colors.accentMinor?.cgColor
        contentView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.center.equalTo(contentView.snp.center)
        }
    }
}
