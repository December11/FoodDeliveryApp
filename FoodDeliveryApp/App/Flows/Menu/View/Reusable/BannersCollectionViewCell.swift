// BannersCollectionViewCell.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class BannersCollectionViewCell: UICollectionViewCell {
    private let imageView: AppImageView = {
        let imageView = AppImageView(contentMode: .scaleAspectFill)
        imageView.roundCorners([.allCorners], radius: Constants.inset10)
        return imageView
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    func configure(URLString: String) {
        imageView.downloadedImage(URLString: URLString)
        configureUI()
    }

    private func configureUI() {
        addSubview(imageView)
        layer.shadowRadius = Constants.inset10
        layer.shadowColor = Colors.bannerShadow?.cgColor
        clipsToBounds = false
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
