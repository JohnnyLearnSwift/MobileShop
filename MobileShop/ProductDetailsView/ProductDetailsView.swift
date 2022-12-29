//
//  ProductDetailsView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import SwiftUI

struct ProductDetailsView: View {
    var viewModel: ProductDetailsViewModel
    let blackColor = Colors.black
    let orangeColor = Colors.orange
    
    var body: some View {
        ScrollView {
            CarouselView(images: viewModel.images)
            SpecificationsView(viewModel: viewModel)
        }
        .navigationTitle(Text("Product details").font(Fonts.shared.getMediumFont(size: 18)).foregroundColor(blackColor))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: LeftBarButtonView(width: 37, height: 37, cornerRadius: 10, image: Image(systemName: "chevron.left"), backgroundColor: blackColor, imageWidth: 7, imageHeight: 14, imageColor: .white),
            trailing: RightBarItemView(width: 37, height: 37, cornerRadius: 10, image: Image(systemName: "bag"), backgroundColor: orangeColor, imageWidth: 14, imageHeight: 14, imageColor: .white, text: "", textColor: .white, textSize: 0)
        )
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(viewModel: ProductDetailsViewModel(phoneProperties: PhoneProperties()))
    }
}
