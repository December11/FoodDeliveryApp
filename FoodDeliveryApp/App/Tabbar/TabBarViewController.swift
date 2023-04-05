// TabBarViewController.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

final class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }

    private func configureTabBar() {
        let dataSource: [TabBarItems] = [.menu, .contacts, .profile, .cart]
        viewControllers = dataSource.map {
            switch $0 {
            case .menu:
                let menuViewController = MenuBuilder.build()
                return self.wrappedInNavigationController(with: menuViewController, title: $0.title)
            case .contacts:
                let contactsViewController = ContactsBuilder.build()
                return self.wrappedInNavigationController(with: contactsViewController, title: $0.title)
            case .profile:
                let profileChoiceListViewController = ProfileBuilder.build()
                return self.wrappedInNavigationController(with: profileChoiceListViewController, title: $0.title)
            case .cart:
                let cartViewController = CartBuilder.build()
                return self.wrappedInNavigationController(with: cartViewController, title: $0.title)
            }
        }

        viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = dataSource[$0].icon
        }

        let tabBarAppearance = UITabBarAppearance()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = Colors.textMinor
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: Colors.textMinor ?? .gray,
            .font: FontStyle.subtitle
        ]
        tabBar.tintColor = Colors.accent
    }

    private func wrappedInNavigationController(with: UIViewController, title: String) -> UINavigationController {
        let navigationViewController = UINavigationController(rootViewController: with)
        navigationViewController.navigationBar.barTintColor = Colors.accent
        navigationViewController.navigationBar.backgroundColor = .white
        navigationViewController.navigationBar.isTranslucent = true

        with.navigationItem.title = title

        return navigationViewController
    }
}
