//
//  HotSalesCell.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 14.12.2022.
//

import SwiftUI

struct HotSalesCell: View {
    let phoneCell: Phone
    let height: CGFloat
    let orangeColor = Colors.shared.orange
    let blackColor = Colors.shared.black
    var isNew: Bool {
        phoneCell.is_new ?? false
    }
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: phoneCell.picture)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "xmark.shield")
            }
            .frame(height: height)
            .cornerRadius(8)
            .padding()
            ZStack {
                Circle()
                    .fill(isNew ? orangeColor : Color.clear)
                    .frame(width: 27, height: 27)
                Text(isNew ? "New" : "")
                    .font(Fonts.shared.getBoldFont(size: 10))
                    .foregroundColor(.white)
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .offset(x: 32, y: 23)
            Text(phoneCell.title)
                .font(Fonts.shared.getBoldFont(size: 25))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: 32, y: 68)
            Text(phoneCell.subtitle ?? "")
                .font(Fonts.shared.getRegularFont(size: 11))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: 32, y: 104)
            Button(action: buttonPressed) {
                Text("Buy now!")
                    .foregroundColor(blackColor)
                    .font(Fonts.shared.getBoldFont(size: 11))
                    .frame(width: 96, height: 23)
                    .background(.white)
            }
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .offset(x: 32, y: 142)

        }
    }
    
    private func buttonPressed() {
        print("button pressed")
    }
}

struct HotSalesCell_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesCell(phoneCell: Phone(is_new: false, title: "", subtitle: "", picture: "", is_buy: false, price_without_discount: 0, discount_price: 0), height: 200)
    }
}
