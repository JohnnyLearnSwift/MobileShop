//
//  Phones.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 13.12.2022.
//

struct Phones: Decodable {
    var home_store: [Phone]?
    var best_seller: [Phone]?
}

struct Phone: Decodable {
    let is_new: Bool?
    let title: String
    let subtitle: String?
    let picture: String
    let is_buy: Bool?
    var is_favorite: Bool?
    let price_without_discount: Int?
    let discount_price: Int?
}

struct PhoneProperties: Decodable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let images: [String]
    var isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}

struct Cart: Decodable {
    let basket: [PhoneInCart]
}

struct PhoneInCart: Decodable {
    let images: String
    let price: Int
    let title: String
}
