// MenuPresenter.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

protocol MenuViewInputProtocol: AnyObject {}

protocol MenuViewOutputProtocol: AnyObject {}

final class MenuPresenter: MenuViewOutputProtocol {
    weak var viewInput: (UIViewController & MenuViewInputProtocol)?
}
