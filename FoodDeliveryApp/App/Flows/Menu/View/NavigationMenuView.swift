// NavigationMenuView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class NavigationMenuView: UIView {
    private let locationLabel = AppLabel(title: "Москва", style: FontStyle.title17)
    private let locationIcon: UIImageView = {
        let imageView = UIImageView(image: Images.chervonDown)
        imageView.contentMode = .center
        return imageView
    }()

    private let bannersCollectionView = BannersCollectionView(imageURLStrings: [])
    private let categoryCollectionView = CategoryCollectionView(
        categories: ["Пицца", "Паста", "Десерты", "Напитки", "Разное"]
    )

    init() {
        super.init(frame: .zero)
        configureUI()
    }

    required init?(coder: NSCoder) { nil }

    private func configureUI() {
        backgroundColor = Colors.backgroundMinor
        addSubviews([locationLabel, locationIcon, bannersCollectionView, categoryCollectionView])

        locationLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(Constants.inset16)
        }
        locationIcon.snp.makeConstraints { make in
            make.leading.equalTo(locationLabel.snp.trailing).offset(Constants.inset16)
            make.top.equalToSuperview().inset(Constants.inset24)
            make.centerY.equalTo(locationLabel.snp.centerY)
        }
        bannersCollectionView.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(Constants.inset24)
            make.horizontalEdges.equalToSuperview()
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bannersCollectionView.snp.bottom).offset(Constants.inset24)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.inset24)
        }
    }
}
