// Menu.swift
// Copyright © Alla Shkolnik. All rights reserved.

struct Menu {
    var sections: [MenuSection]
}

struct MenuSection {
    let category: String
    let dishes: [Dish]
}
