//
//  MyCartViewModel.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import SwiftUI

protocol MyCartViewModelProtocol {
    var basket: [PhoneInCart] { get }
    var delivery: String { get }
    
    init(cart: Cart)
}

class MyCartViewModel: MyCartViewModelProtocol, ObservableObject {
    
    var basket: [PhoneInCart] {
        cart.basket ?? []
    }
    
    var delivery: String {
        cart.delivery ?? ""
    }
    
    @Published var cartItems: [PhoneInCartWithQuantity]
    @Published var sum: Int
    
    private let cart: Cart
    
    required init(cart: Cart) {
        self.cart = cart
        self.cartItems = []
        self.sum = 0
        getProducts()
    }

    func getProducts() {
        for product in basket {
            var isFindSimmilar = false
            sum += product.price
            for index in cartItems.indices {
                if cartItems[index].phone.id == product.id {
                    cartItems[index].quantity += 1
                    isFindSimmilar = true
                    break
                }
            }
            if isFindSimmilar == false {
                let phone = PhoneInCartWithQuantity(id: cartItems.count, phone: product, quantity: 1)
                cartItems.append(phone)
            }
        }
    }
    
    func addProduct(phone: PhoneInCart) {
        var isFindSimmilar = false
        sum += phone.price
        for index in cartItems.indices {
            if cartItems[index].phone.id == phone.id {
                cartItems[index].quantity += 1
                isFindSimmilar = true
                break
            }
        }
        if isFindSimmilar == false {
            let phone = PhoneInCartWithQuantity(id: cartItems.count, phone: phone, quantity: 1)
            cartItems.append(phone)
        }
    }
    
    func removeProduct(phone: PhoneInCart) {
        sum -= phone.price
        for index in cartItems.indices {
            if cartItems[index].phone.id == phone.id {
                cartItems[index].quantity -= 1
                if cartItems[index].quantity == 0 {
                    cartItems.remove(at: index)
                }
                break
            }
        }
    }
}
