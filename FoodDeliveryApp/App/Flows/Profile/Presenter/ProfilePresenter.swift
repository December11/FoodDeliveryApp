// ProfilePresenter.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

protocol ProfileViewInputProtocol: AnyObject {}

protocol ProfileViewOutputProtocol: AnyObject {}

final class ProfilePresenter: ProfileViewOutputProtocol {
    weak var viewInput: (UIViewController & ProfileViewInputProtocol)?
}
