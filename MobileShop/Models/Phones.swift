//
//  Phones.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 13.12.2022.
//

import Foundation

struct Phones: Decodable {
    var home_store: [Phone]?
    var best_seller: [Phone]?
}

struct Phone: Decodable, Hashable {
    let is_new: Bool?
    let title: String
    let subtitle: String?
    let picture: String
    let is_buy: Bool?
    var is_favorites: Bool?
    let price_without_discount: Int?
    let discount_price: Int?
}

struct PhoneProperties: Decodable {
    var CPU: String?
    var camera: String?
    var capacity: [String]?
    var color: [String]?
    var images: [String]?
    var isFavorites: Bool?
    var price: Int?
    var rating: Double?
    var sd: String?
    var ssd: String?
    var title: String?
}

struct Cart: Decodable {
    var basket: [PhoneInCart]?
    var delivery: String?
}

struct PhoneInCart: Decodable, Equatable, Identifiable {
    let id: Int
    let images: String
    let price: Int
    var title: String
}

struct PhoneInCartWithQuantity: Identifiable, Equatable {
    let id: Int
    var phone: PhoneInCart
    var quantity: Int
}
