// CartPresenter.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

protocol CartViewInputProtocol: AnyObject {}

protocol CartViewOutputProtocol: AnyObject {}

final class CartPresenter: CartViewOutputProtocol {
    weak var viewInput: (UIViewController & CartViewInputProtocol)?
}
