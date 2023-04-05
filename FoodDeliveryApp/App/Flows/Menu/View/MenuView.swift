// MenuView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class MenuView: UIView {
    var didScrollingUp: (() -> ())?
    var didScrollingDown: (() -> ())?

    private let headerView: HeaderView
    private let menuTableView: MenuTableView
    private let duration = 0.25
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

        menuTableView.didScrollToNextSection = { [weak self] section in
            guard let self else { return }
            self.headerView.selectCategory(index: section)
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
                UIView.animate(withDuration: self.duration) {
                    self.headerView.snp.updateConstraints { update in
                        update.height.equalTo(Constants.inset260)
                    }
                    self.menuTableView.roundCorners([.allCorners], radius: Constants.inset20)
                    self.headerView.layer.shadowOpacity = 0
                    self.layoutIfNeeded()
                }
            case .down:
                self.didScrollingDown?()
                self.headerView.collapseHeader()
                UIView.animate(withDuration: self.duration) {
                    self.menuTableView.layer.cornerRadius = 0
                    self.headerView.layer.zPosition = 2
                    self.headerView.snp.updateConstraints { update in
                        update.height.equalTo(Constants.inset120)
                    }
                    self.headerView.clipsToBounds = false
                    self.headerView.layer.shadowColor = Colors.headerShadow?.cgColor
                    self.headerView.layer.shadowOpacity = 1.0
                    self.headerView.layer.shadowRadius = Constants.inset6
                    self.headerView.layer.shadowOffset = CGSize(width: 0, height: Constants.inset10)
                    self.layoutIfNeeded()
                }
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
