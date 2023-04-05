// CartPresenter.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

protocol CartViewInputProtocol: AnyObject {}

protocol CartViewOutputProtocol: AnyObject {}

final class CartPresenter: CartViewOutputProtocol {
    weak var viewInput: (UIViewController & CartViewInputProtocol)?
}
