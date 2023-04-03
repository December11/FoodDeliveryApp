// MenuTableViewCell.swift
// Copyright © Alla Shkolnik. All rights reserved.

import SnapKit
import UIKit

// TODO: - добавить изображение, поменять на данные из сети
struct MenuConfiguration {
    let title: String = "Баварские колбаски"
    let description: String = "Баварские колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус"
    let buttonTitle: String = "от 249₽"
}

final class MenuTableViewCell: UITableViewCell {
    private let mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
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

    func configure(content: MenuConfiguration) {
        mealImageView.image = UIImage(systemName: "pencil.circle")
        titleLabel.text = content.title
        descriptionLabel.text = content.description
        button.configure(title: content.buttonTitle)
        configureUI()
    }

    private func configureUI() {
        addSubviews([mealImageView, titleLabel, descriptionLabel, button])

        mealImageView.snp.makeConstraints { make in
            make.leading.verticalEdges.equalToSuperview().inset(Constants.inset16)
            make.width.equalTo(100)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(Constants.inset16)
            make.leading.equalTo(mealImageView.snp.trailing).offset(Constants.inset32)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.inset16)
            make.trailing.equalToSuperview().inset(Constants.inset16)
            make.leading.equalTo(mealImageView.snp.trailing).offset(Constants.inset32)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(Constants.inset16)
            make.bottom.trailing.equalToSuperview().inset(Constants.inset16)
        }
    }
}
