// HeaderView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class HeaderView: UIView {
    var categoryWasChoosen: ((String) -> Void)? {
        didSet {
            categoryCollectionView.categoryWasChoosen = categoryWasChoosen
        }
    }

    private let duration = 0.25
    private let locationLabel = AppLabel(title: Texts.defaultCity, style: FontStyle.title17)
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
        UIView.animate(withDuration: duration) {
            self.bannersCollectionView.alpha = 0
            self.bannersCollectionView.snp.updateConstraints { update in
                update.height.equalTo(0)
            }
            self.categoryCollectionView.snp.updateConstraints { update in
                update.top.equalTo(self.bannersCollectionView.snp.bottom)
            }
        }
    }

    func restoreHeader() {
        UIView.animate(withDuration: duration) {
            self.bannersCollectionView.snp.updateConstraints { update in
                update.height.equalTo(Constants.inset300)
            }
            self.bannersCollectionView.alpha = Constants.inset1
            self.categoryCollectionView.snp.updateConstraints { update in
                update.top.equalTo(self.bannersCollectionView.snp.bottom).offset(Constants.inset24)
            }
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
            make.height.equalTo(Constants.inset260)
        }

        locationLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(Constants.inset16)
        }
        locationIcon.snp.makeConstraints { make in
            make.leading.equalTo(locationLabel.snp.trailing).offset(Constants.inset8)
            make.top.equalToSuperview().inset(Constants.inset24)
            make.centerY.equalTo(locationLabel.snp.centerY)
        }
        bannersCollectionView.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(Constants.inset24)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(Constants.inset300)
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bannersCollectionView.snp.bottom).offset(Constants.inset24)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.inset24)
        }
    }
}
