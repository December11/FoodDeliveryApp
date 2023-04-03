// ProfileBuilder.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

final class ProfileBuilder {
    static func build() -> (UIViewController & ProfileViewInputProtocol) {
        let presenter = ProfilePresenter()
        let viewController = ProfileViewController(presenter: presenter)

        presenter.viewInput = viewController
        return viewController
    }
}
