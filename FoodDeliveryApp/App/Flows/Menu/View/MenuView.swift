// MenuView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class MenuView: UIView {
    private let navigationView = NavigationMenuView()
    private let menuTableView = MenuTableView()

    init() {
        super.init(frame: .zero)
        configureUI()
    }

    required init?(coder: NSCoder) { nil }

    private func configureUI() {
        backgroundColor = Colors.backgroundMinor
        addSubviews([navigationView, menuTableView])
        navigationView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.height.equalTo(260)
        }
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
