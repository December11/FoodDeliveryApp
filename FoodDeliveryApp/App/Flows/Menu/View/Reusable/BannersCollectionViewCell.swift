// BannersCollectionViewCell.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class BannersCollectionViewCell: UICollectionViewCell {
//    private let imageView: UIImageViewAsync = {
//        let imageView = UIImageViewAsync()
//        imageView.layer.masksToBounds = true
//        imageView.layer.cornerRadius = Constants.inset10
//        return imageView
//    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.roundCorners([.allCorners], radius: Constants.inset10)
        return imageView
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

//    func configure(content: String) {
//        imageView.downloadedImage(from: content, contentMode: .scaleAspectFill)
//        imageView.image = UIImage(systemName: "pencil.circle")
//        configureUI()
//    }

    func configure() {
//        imageView.downloadedImage(from: content, contentMode: .scaleAspectFill)
        imageView.image = UIImage(systemName: "pencil.circle")
        configureUI()
    }

    private func configureUI() {
        addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}