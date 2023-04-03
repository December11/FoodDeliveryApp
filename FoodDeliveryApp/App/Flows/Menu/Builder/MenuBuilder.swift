// MenuBuilder.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

final class MenuBuilder {
    static func build() -> (UIViewController & MenuViewInputProtocol) {
        let presenter = MenuPresenter()
        let viewController = MenuViewController(presenter: presenter)

        presenter.viewInput = viewController
        return viewController
    }
}
