// ProfileViewController.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

final class ProfileViewController: UIViewController, ProfileViewInputProtocol {
    let presenter: ProfilePresenter

    init(presenter: ProfilePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = Colors.backgroundMain
    }

    required init?(coder: NSCoder) { nil }
}
