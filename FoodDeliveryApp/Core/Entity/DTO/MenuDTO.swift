// MenuDTO.swift
// Copyright © Alla Shkolnik. All rights reserved.

import Foundation

struct MenuDTO: Decodable {
    let title: String
    let dishes: [DishDTO]
}

struct DishDTO: Decodable {
    let name, description, price, photoLink: String
}
