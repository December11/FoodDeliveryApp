// MenuBuilder.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class MenuBuilder {
    static func build() -> (UIViewController & MenuViewInputProtocol) {
        let presenter = MenuPresenter(provider: NetworkService())
        let viewController = MenuViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
