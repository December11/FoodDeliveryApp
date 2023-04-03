// ContactsViewController.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

final class ContactsViewController: UIViewController, ContactsViewInputProtocol {
    let presenter: ContactsPresenter

    init(presenter: ContactsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = Colors.backgroundMain
    }

    required init?(coder: NSCoder) { nil }
}
