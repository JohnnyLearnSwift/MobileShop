//
//  MainViewModel.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var phones: Phones { get }
    var phoneProperties: PhoneProperties { get }
    var cart: Cart { get }
    
    func fetchPhones()
    func fetchPhoneProperties()
    func fetchCart()
}

class MainViewModel: MainViewModelProtocol, ObservableObject {
    @Published var phones: Phones = Phones()
    @Published var phoneProperties: PhoneProperties = PhoneProperties()
    @Published var cart: Cart = Cart()
    
    let dataFetcherServices: DataFetcherServiceProtocol = DataFetcherService()
    
    func fetchPhones() {
        dataFetcherServices.fetchPhones { [unowned self] phones in
            self.phones = phones ?? Phones()
        }
    }
    
    func fetchPhoneProperties() {
        dataFetcherServices.fetchPhoneProperties { [unowned self] phoneProperties in
            self.phoneProperties = phoneProperties ?? PhoneProperties()
        }
    }
    
    func fetchCart() {
        dataFetcherServices.fetchCart { [unowned self] cart in
            self.cart = cart ?? Cart()
        }
    }
}
