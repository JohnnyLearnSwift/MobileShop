//
//  BestSellerCollectionView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 20.12.2022.
//

import SwiftUI

struct BestSellerCollectionView: View {
    @StateObject var mainViewModel: MainViewModel
    let columns = [GridItem(.adaptive(minimum: 180, maximum: 181))]
    var phones: [Phone] {
        mainViewModel.phones.best_seller ?? []
    }
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(phones, id: \.title) { phone in
                NavigationLink(destination: ProductDetailsView(viewModel: ProductDetailsViewModel(phoneProperties: mainViewModel.phoneProperties))) {
                    BestSellerCell(phoneCell: phone)
                }
                
            }
        }
    }
}

struct BestSellerCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerCollectionView(mainViewModel: MainViewModel())
    }
}
