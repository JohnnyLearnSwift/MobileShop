//
//  ProductDetailsViewModel.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import Foundation

protocol ProductDetailsViewModelProtocol {
    var CPU: String { get }
    var camera: String { get }
    var capacity: [String] { get }
    var color: [String] { get }
    var images: [String] { get }
    var isFavorites: Bool { get }
    var price: Int { get }
    var rating: Double { get }
    var sd: String { get }
    var ssd: String { get }
    var title: String { get }
    
    init(phoneProperties: PhoneProperties)

}

class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    var CPU: String {
        phoneProperties.CPU ?? ""
    }
    
    var camera: String {
        phoneProperties.camera ?? ""
    }
    
    var capacity: [String] {
        phoneProperties.capacity ?? []
    }
    
    var color: [String] {
        phoneProperties.color ?? []
    }
    
    var images: [String] {
        phoneProperties.images ?? []
    }
    
    var isFavorites: Bool {
        phoneProperties.isFavorites ?? false
    }
    
    var price: Int {
        phoneProperties.price ?? 0
    }
    
    var rating: Double {
        phoneProperties.rating ?? 0
    }
    
    var sd: String {
        phoneProperties.sd ?? ""
    }
    
    var ssd: String {
        phoneProperties.ssd ?? ""
    }
    
    var title: String {
        phoneProperties.title ?? ""
    }
    
    private let phoneProperties: PhoneProperties
    
    required init(phoneProperties: PhoneProperties) {
        self.phoneProperties = phoneProperties
    }
    
}
