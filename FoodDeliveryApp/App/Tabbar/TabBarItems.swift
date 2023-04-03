// TabBarItems.swift
// Copyright © Darkness Production. All rights reserved.

import UIKit

enum TabBarItems: Int {
    case menu
    case contacts
    case profile
    case cart

    var title: String {
        switch self {
        case .menu:
            return Texts.menuTabbar
        case .contacts:
            return Texts.contactsTabbar
        case .profile:
            return Texts.profileTabbar
        case .cart:
            return Texts.cartTabbar
        }
    }

    var icon: UIImage {
        switch self {
        case .menu:
            return Images.menuTabbar
        case .contacts:
            return Images.contactsTabbar
        case .profile:
            return Images.profileTabbar
        case .cart:
            return Images.cartTabbar
        }
    }
}
