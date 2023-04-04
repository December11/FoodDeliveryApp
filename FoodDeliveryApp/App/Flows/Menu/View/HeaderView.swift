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
        UIView.animate(withDuration: 0.4, delay: 0.1) {
            self.bannersCollectionView.layer.opacity = 0.0
            self.bannersCollectionView.transform = CGAffineTransform(scaleX: 0, y: 0)
            self.layoutSubviews()
        } completion: { _ in
            self.bannersCollectionView.isHidden = true
            self.categoryCollectionView.snp.remakeConstraints { remake in
                remake.top.equalTo(self.locationLabel.snp.bottom).offset(Constants.inset24)
                remake.horizontalEdges.equalToSuperview()
                remake.bottom.equalToSuperview().inset(Constants.inset24)
            }
        }
    }

    func restoreHeader() {
        UIView.animate(withDuration: 0.4, delay: 0.1) {
            self.bannersCollectionView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.bannersCollectionView.layer.opacity = 1.0
            self.layoutSubviews()
        } completion: { _ in
            UIView.animate(withDuration: 0.6, delay: 0.1) {
                self.bannersCollectionView.isHidden = false
                self.categoryCollectionView.snp.remakeConstraints { remake in
                    remake.top.equalTo(self.bannersCollectionView.snp.bottom).offset(Constants.inset24)
                    remake.horizontalEdges.equalToSuperview()
                    remake.bottom.equalToSuperview().inset(Constants.inset24)
                }
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
