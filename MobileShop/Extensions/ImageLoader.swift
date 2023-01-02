//
//  ImageLoader.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 16.12.2022.
//

import SwiftUI

protocol ImageLoaderProtocol {
    func fetchImageData(from url: String) -> Image
    func getImage(from data: Data?) -> Image
}

class ImageLoader: ImageLoaderProtocol {
    
    func fetchImageData(from url: String) -> Image {
        guard let imageURL = URL(string: url) else { return Image(systemName: "xmark.shield") }
        guard let imageData = try? Data(contentsOf: imageURL) else { return Image(systemName: "xmark.shield") }
        return getImage(from: imageData)
    }
    
    internal func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "xmark.shield")}
        guard let image = UIImage(data: data) else { return Image(systemName: "xmark.shield")}
        return Image(uiImage: image)
    }
}
