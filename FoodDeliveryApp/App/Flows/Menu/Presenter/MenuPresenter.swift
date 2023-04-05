// MenuPresenter.swift
// Copyright © Alla Shkolnik. All rights reserved.

import UIKit

protocol MenuViewInputProtocol: AnyObject {
    func showErrorBackground()
}

protocol MenuViewOutputProtocol: AnyObject {
    func fetch(completion: @escaping (Menu) -> Void)
}

final class MenuPresenter: MenuViewOutputProtocol {
    weak var viewInput: (UIViewController & MenuViewInputProtocol)?

    private var provider: any RequestProtocol

    init(provider: any RequestProtocol) {
        self.provider = provider
    }

    func fetch(completion: @escaping (Menu) -> Void) {
        provider.fetch { [weak self] result in
            guard let self else { return }
            switch result {
            case let .failure(error):
                self.viewInput?.showErrorBackground()
                debugPrint(error)
            case let .success(DTOObject):
                var sections = [MenuSection]()
                DTOObject.forEach { object in
                    let dishes = object.dishes.map {
                        Dish(
                            title: $0.name,
                            description: $0.description,
                            price: $0.price,
                            imageURLString: $0.photoLink
                        )
                    }
                    sections.append(MenuSection(category: object.title, dishes: dishes))
                }
                completion(Menu(sections: sections))
            }
        }
    }
}
