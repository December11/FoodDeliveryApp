// HeaderView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class HeaderView: UIView {
    var categoryWasChoosen: ((String) -> Void)? {
        didSet {
            categoryCollectionView.categoryWasChoosen = categoryWasChoosen
        }
    }

    private let locationLabel = AppLabel(title: "Москва", style: FontStyle.title17)
    private let locationIcon: UIImageView = {
        let imageView = UIImageView(image: Images.chervonDown)
        imageView.contentMode = .center
        return imageView
    }()

    private let bannersCollectionView = BannersCollectionView(imageURLStrings: Constants.bannerURLs)
    private let categoryCollectionView: CategoryCollectionView

    init(categories: [String]) {
        categoryCollectionView = CategoryCollectionView(categories: categories)
        super.init(frame: .zero)
        configureUI()
    }

    required init?(coder: NSCoder) { nil }

    func collapseHeader() {
        UIView.animate(withDuration: 0.25) {
            self.bannersCollectionView.alpha = 0.0
            self.bannersCollectionView.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
//            self.bannersCollectionView.transform = CGAffineTransform(scaleX: 0, y: 0)
//            self.layoutIfNeeded()
        }
    }

    func restoreHeader() {
        UIView.animate(withDuration: 0.25) {
//            self.bannersCollectionView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bannersCollectionView.snp.updateConstraints { make in
                make.height.equalTo(300)
            }
            self.bannersCollectionView.alpha = 1.0
//            self.layoutIfNeeded()
        }
    }

    func selectCategory(index: Int) {
        categoryCollectionView.collectionView(
            categoryCollectionView,
            didSelectItemAt: IndexPath(item: index, section: 0)
        )
    }

    private func configureUI() {
        backgroundColor = Colors.backgroundMinor
        addSubviews([locationLabel, locationIcon, bannersCollectionView, categoryCollectionView])

        snp.makeConstraints { make in
            make.height.equalTo(260)
        }

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
            make.height.equalTo(300)
//            make.width.equalTo(112 * 2 + 16)
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bannersCollectionView.snp.bottom).offset(Constants.inset24)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.inset24)
        }
    }
}
