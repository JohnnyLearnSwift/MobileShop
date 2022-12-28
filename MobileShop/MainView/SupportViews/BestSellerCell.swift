//
//  BestSellerCell.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 20.12.2022.
//

import SwiftUI

struct BestSellerCell: View {
    let phoneCell: Phone
    let orangeColor = Colors.shared.orange
    let blackColor = Colors.shared.black
    let grayColor = Colors.shared.gray
    var isFavorite: Bool {
        phoneCell.is_favorites ?? false
    }
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 227)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 1)
            AsyncImage(url: URL(string: phoneCell.picture)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "xmark.shield")
            }
            .frame(height: 168, alignment: .bottom)
            .offset(x: 0, y: -29)
            FavoriteView(isFavorite: isFavorite)
                .offset(x: 62, y: -90)
            VStack {
                HStack (alignment: .bottom) {
                    Text("$\(phoneCell.price_without_discount ?? 0)")
                        .font(Fonts.shared.getBoldFont(size: 16))
                        .foregroundColor(blackColor)
                    Text("$\(phoneCell.discount_price ?? 0)")
                        .font(Fonts.shared.getMediumFont(size: 10))
                        .foregroundColor(grayColor)
                        .strikethrough()
                    Spacer()
                }
                HStack {
                    Text("\(phoneCell.title)")
                        .font(Fonts.shared.getRegularFont(size: 10))
                        .foregroundColor(blackColor)
                    Spacer()
                }
            }
            
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .offset(x: 21, y: 174)
        }
    }
}

struct FavoriteView: View {
    var isFavorite: Bool
    let orangeColor = Colors.shared.orange
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .shadow(radius: 1)
                .frame(width: 25, height: 25)
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 11, height: 10)
                .foregroundColor(orangeColor)
        }
    }
}

struct BestSellerCell_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerCell(phoneCell: Phone(is_new: false, title: "", subtitle: "", picture: "", is_buy: false, price_without_discount: 0, discount_price: 0))
    }
}
