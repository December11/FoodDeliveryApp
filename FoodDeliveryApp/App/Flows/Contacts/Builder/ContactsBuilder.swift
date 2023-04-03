// ContactsBuilder.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class ContactsBuilder {
    static func build() -> (UIViewController & ContactsViewInputProtocol) {
        let presenter = ContactsPresenter()
        let viewController = ContactsViewController(presenter: presenter)

        presenter.viewInput = viewController
        return viewController
    }
}
