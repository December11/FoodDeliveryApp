// MenuTableView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

enum ScrollingDirection {
    case down, up
}

final class MenuTableView: UITableView {
    var didStartScrolling: ((ScrollingDirection) -> ())?

    private var previousScrollDirection: ScrollingDirection?
    private var values: Menu

    init(menu: Menu) {
        values = menu
        super.init(frame: .zero, style: .plain)
        configure()
    }

    required init?(coder: NSCoder) { nil }

    func scrollToSection(sectionIndex: Int) {
        let indexPath = IndexPath(row: 0, section: sectionIndex)
        scrollToRow(at: indexPath, at: .top, animated: true)
    }

    private func configure() {
        dataSource = self
        delegate = self
        registerCell(MenuTableViewCell.self)

        backgroundColor = Colors.backgroundMain
        roundCorners([.topLeft, .topRight], radius: Constants.inset20)
        separatorStyle = .none
        allowsSelection = false
    }
}

// MARK: - UITableViewDataSource

extension MenuTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        values.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard values.sections.indices.contains(section) else { return 0 }
        return values.sections[section].dishes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard values.sections.indices.contains(indexPath.section),
              values.sections[indexPath.section].dishes.count > indexPath.row,
              let cell: MenuTableViewCell = tableView.cell(forRowAt: indexPath)
        else { return UITableViewCell() }
        let dishes = values.sections[indexPath.section].dishes
        cell.configure(content: dishes[indexPath.row], isFirst: indexPath.section == 0 && indexPath.row == 0)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MenuTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        guard values.indices.contains(indexPath.row) else { return }
//        didSelectRowHandler?(values[indexPath.row])
    }
}

extension MenuTableView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scrolling did scrolled")
        if scrollView.contentOffset.y < 0 {
            print("Scrolling up")
            if previousScrollDirection != .up {
                didStartScrolling?(.up)
            }
            previousScrollDirection = .up
        } else if scrollView.contentOffset.y > 0 {
            print("Scrolling down")
            if previousScrollDirection != .down {
                didStartScrolling?(.down)
            }
            previousScrollDirection = .down
        }
    }
}
