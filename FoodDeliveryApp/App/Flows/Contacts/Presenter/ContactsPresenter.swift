// ContactsPresenter.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

protocol ContactsViewInputProtocol: AnyObject {}

protocol ContactsViewOutputProtocol: AnyObject {}

final class ContactsPresenter: ContactsViewOutputProtocol {
    weak var viewInput: (UIViewController & ContactsViewInputProtocol)?
}
