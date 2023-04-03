// MenuViewController.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class MenuViewController: UIViewController, MenuViewInputProtocol {
    weak var presenter: MenuPresenter?

    private let contentView = MenuView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = Colors.backgroundMinor
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }

        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isTranslucent = false
    }
}
