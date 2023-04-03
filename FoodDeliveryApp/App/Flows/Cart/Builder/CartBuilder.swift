// CartBuilder.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

final class CartBuilder {
    static func build() -> (UIViewController & CartViewInputProtocol) {
        let presenter = CartPresenter()
        let viewController = CartViewController(presenter: presenter)

        presenter.viewInput = viewController
        return viewController
    }
}
