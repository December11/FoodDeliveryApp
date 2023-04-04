// MenuView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class MenuView: UIView {
    var didScrollingUp: (() -> ())?
    var didScrollingDown: (() -> ())?

    private let headerView: HeaderView
    private let menuTableView: MenuTableView
    private var currentCategory: String?
    private var previousCategory: String?
    private var menu: Menu

    init(menu: Menu) {
        self.menu = menu
        headerView = HeaderView(categories: menu.sections.map { $0.category })
        menuTableView = MenuTableView(menu: menu)
        currentCategory = menu.sections.first?.category
        super.init(frame: .zero)
        configure()
        configureUI()
    }

    required init?(coder: NSCoder) { nil }

    private func configure() {
        headerView.categoryWasChoosen = { [weak self] category in
            guard let self else { return }
            let categories = self.menu.sections.map { $0.category }
            if let index = categories.firstIndex(of: category) {
                self.menuTableView.scrollToSection(sectionIndex: index)
            }
        }

        menuTableView.didStartScrolling = { [weak self] direction in
            guard let self else { return }
            self.headerView.layer.shadowColor = Colors.headerShadow?.cgColor
            self.headerView.layer.shadowRadius = 14.0
            self.headerView.clipsToBounds = false
            switch direction {
            case .up:
                self.didScrollingUp?()
                self.headerView.restoreHeader()
                self.headerView.snp.updateConstraints { update in
                    update.height.equalTo(260)
                }
                UIView.animate(withDuration: 1.0, delay: 0.5) {}
            case .down:
                self.didScrollingDown?()
                self.headerView.collapseHeader()
                self.headerView.snp.updateConstraints { update in
                    update.height.equalTo(120)
                }
                UIView.animate(withDuration: 1.0, delay: 0.5) {}
            }
        }
    }

    private func configureUI() {
        backgroundColor = Colors.backgroundMinor
        addSubviews([headerView, menuTableView])
        headerView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.height.equalTo(260)
        }
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
