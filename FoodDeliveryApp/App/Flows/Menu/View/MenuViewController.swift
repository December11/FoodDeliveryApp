// MenuViewController.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

final class MenuViewController: UIViewController, MenuViewInputProtocol {
    let presenter: MenuPresenter

    init(presenter: MenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = Colors.backgroundMain
    }

    required init?(coder: NSCoder) { nil }
}
