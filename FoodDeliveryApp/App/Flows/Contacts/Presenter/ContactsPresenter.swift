// ContactsPresenter.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

protocol ContactsViewInputProtocol: AnyObject {}

protocol ContactsViewOutputProtocol: AnyObject {}

final class ContactsPresenter: ContactsViewOutputProtocol {
    weak var viewInput: (UIViewController & ContactsViewInputProtocol)?
}
