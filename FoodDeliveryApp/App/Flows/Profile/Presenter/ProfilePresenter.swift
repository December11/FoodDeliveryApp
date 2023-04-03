// ProfilePresenter.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

protocol ProfileViewInputProtocol: AnyObject {}

protocol ProfileViewOutputProtocol: AnyObject {}

final class ProfilePresenter: ProfileViewOutputProtocol {
    weak var viewInput: (UIViewController & ProfileViewInputProtocol)?
}
