// MenuTableView.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class MenuTableView: UITableView {
    ///  Замыкание для определения поведения, когда было выбрано значение в таблице
    var didSelectRowHandler: ((String) -> Void)?

//    private var values = [String]()

    init(values: [MenuConfiguration] = []) {
//        self.values = values
        super.init(frame: .zero, style: .plain)
        configure()
    }

    required init?(coder: NSCoder) { nil }

    private func configure() {
        dataSource = self
//        delegate = self
        registerCell(MenuTableViewCell.self)

        backgroundColor = Colors.backgroundMain
        roundCorners([.topLeft, .topRight], radius: Constants.inset20)
        separatorStyle = .none
        allowsSelection = false
    }
}

// MARK: - UITableViewDataSource

extension MenuTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10 // values.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard values.indices.contains(indexPath.row) else { return UITableViewCell() }
        guard
            let cell: MenuTableViewCell = tableView.cell(forRowAt: indexPath)
        else { return UITableViewCell() }
        let content = MenuConfiguration()
//        cell.configure(content: values[indexPath.row])
        cell.configure(content: content)
        return cell
    }
}

// MARK: - UITableViewDelegate

// extension MenuTableView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        guard values.indices.contains(indexPath.row) else { return }
//        didSelectRowHandler?(values[indexPath.row])
//    }
// }
