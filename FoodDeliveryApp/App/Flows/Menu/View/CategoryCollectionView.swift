// CategoryCollectionView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import SnapKit
import UIKit

final class CategoryCollectionView: UICollectionView {
    private struct Layout {
        static let itemWidth: CGFloat = 88
        static let itemHeight: CGFloat = 32
    }

    var itemTapCompletion: ((String) -> Void)?

    private var selectedIndex = 0
    private let contents: [String]
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = Constants.inset8
        layout.itemSize = CGSize(width: Layout.itemWidth, height: Layout.itemHeight)
        return layout
    }()

    // MARK: - Construction

    init(categories: [String]) {
        contents = categories
        super.init(frame: .zero, collectionViewLayout: layout)
        configure()
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - Private functions

    private func configure() {
        dataSource = self
        delegate = self
        allowsMultipleSelection = false
        registerCell(CategoryCollectionViewCell.self)
        configureUI()
    }

    private func configureUI() {
        showsHorizontalScrollIndicator = false
        backgroundColor = Colors.backgroundMinor
        contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

// MARK: - UICollectionViewDataSource

extension CategoryCollectionView: UICollectionViewDataSource {
    // MARK: - Functions

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contents.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            !contents.isEmpty,
            contents.indices.contains(indexPath.item),
            let cell: CategoryCollectionViewCell = collectionView.cell(forRowAt: indexPath)
        else { return UICollectionViewCell() }
        cell.configure(title: contents[indexPath.item], isSelected: indexPath.item == selectedIndex)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CategoryCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        reloadData()
    }
}
