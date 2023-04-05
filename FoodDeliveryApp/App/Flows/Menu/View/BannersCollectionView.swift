// BannersCollectionView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class BannersCollectionView: UICollectionView {
    private struct Layout {
        static let itemWidth: CGFloat = 300
        static let itemHeight: CGFloat = 112
    }

    private let contents: [String]
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = Constants.inset16
        layout.itemSize = CGSize(width: Layout.itemWidth, height: Layout.itemHeight)
        return layout
    }()

    init(imageURLStrings: [String]) {
        contents = imageURLStrings
        super.init(frame: .zero, collectionViewLayout: layout)
        configure()
    }

    required init?(coder: NSCoder) { nil }

    private func configure() {
        dataSource = self
        registerCell(BannersCollectionViewCell.self)
        configureUI()
    }

    private func configureUI() {
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: Constants.inset16, bottom: 0, right: Constants.inset16)
        backgroundColor = Colors.backgroundMinor
    }
}

// MARK: - UICollectionViewDataSource

extension BannersCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contents.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            contents.indices.contains(indexPath.item),
            let cell: BannersCollectionViewCell = collectionView.cell(forRowAt: indexPath)
        else { return UICollectionViewCell() }
        cell.configure(URLString: contents[indexPath.row])
        return cell
    }
}
