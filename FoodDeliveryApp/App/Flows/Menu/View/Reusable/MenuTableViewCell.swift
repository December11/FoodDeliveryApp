// MenuTableViewCell.swift
// Copyright © Alla Shkolnik. All rights reserved.

import SnapKit
import UIKit

final class MenuTableViewCell: UITableViewCell {
    private let mealImageView: AppImageView = {
        let image = AppImageView(contentMode: .scaleAspectFill)
        image.roundCorners([.allCorners], radius: Constants.inset8)
        return image
    }()

    private let separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = Colors.backgroundMinor
        return separator
    }()

    private let titleLabel = AppLabel(style: FontStyle.title16)
    private let descriptionLabel = AppLabel(style: FontStyle.subtitle, fontColor: Colors.textMinor, numberLines: 0)
    private let button = AddToCartButton()

    override func prepareForReuse() {
        super.prepareForReuse()
        mealImageView.image = nil
        titleLabel.text = ""
        descriptionLabel.text = ""
    }

    func configure(content: Dish, isFirst: Bool) {
        configureUI()
        separatorView.isHidden = isFirst
        mealImageView.downloadedImage(URLString: content.imageURLString)
        titleLabel.text = content.title
        descriptionLabel.text = content.description
        button.configure(title: "от \(content.price)")
    }

    private func configureUI() {
        addSubviews([mealImageView, titleLabel, descriptionLabel, button, separatorView])

        separatorView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(Constants.inset1)
            make.width.equalTo(snp.width)
        }
        mealImageView.snp.makeConstraints { make in
            make.leading.verticalEdges.equalToSuperview().inset(Constants.inset16)
            make.width.height.equalTo(Constants.inset132)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.inset16)
            make.trailing.equalToSuperview().inset(Constants.inset24)
            make.leading.equalTo(mealImageView.snp.trailing).offset(Constants.inset32)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.inset8)
            make.trailing.equalToSuperview().inset(Constants.inset24)
            make.leading.equalTo(mealImageView.snp.trailing).offset(Constants.inset32)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(Constants.inset16)
            make.trailing.equalToSuperview().inset(Constants.inset24)
            make.bottom.equalToSuperview().inset(Constants.inset16)
            make.height.equalTo(Constants.inset32)
        }
    }
}
