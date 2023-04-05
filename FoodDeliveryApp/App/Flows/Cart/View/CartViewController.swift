// CartViewController.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class CartViewController: UIViewController, CartViewInputProtocol {
    let presenter: CartPresenter

    init(presenter: CartPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = Colors.backgroundMain
    }

    required init?(coder: NSCoder) { nil }
}
