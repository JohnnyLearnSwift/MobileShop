//
//  CartCardView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 26.12.2022.
//

import SwiftUI

struct CartCardView: View {
    @EnvironmentObject var cart: MyCartViewModel
    let orangeColor = Colors.orange
    let grayColor = Colors.grayTrash
    let black = Colors.blackButtons
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                ForEach(cart.cartItems) { product in
                    HStack(spacing: 5){
                        AsyncImage(url: URL(string: product.phone.images)) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "xmark.shield")
                        }
                        .frame(width: 111, height: 89)
                        .cornerRadius(10)
                        .alignmentGuide(.leading) { d in
                            d[HorizontalAlignment.leading]
                        }
                        
                        VStack {
                            Text(product.phone.title)
                                .font(Fonts.shared.getMediumFont(size: 20))
                                .foregroundColor(.white)
                                .alignmentGuide(.leading) { d in
                                    d[HorizontalAlignment.leading]
                                }
                            HStack {
                                Text("$\(product.phone.price * product.quantity)")
                                    .font(Fonts.shared.getMediumFont(size: 20))
                                    .foregroundColor(orangeColor)
                                    .alignmentGuide(.leading) { d in
                                        d[HorizontalAlignment.leading]
                                    }
                                Spacer()
                            }
                            .padding(.leading, 5)
                            
                        }
                        Spacer()
                        ZStack {
                            Rectangle()
                                .frame(width: 26, height: 68)
                                .cornerRadius(26)
                                .foregroundColor(black)
                            VStack {
                                Button {
                                    cart.removeProduct(phone: product.phone)
                                } label: {
                                    Image(systemName: "minus")
                                        .frame(width: 10, height: 10)
                                }
                                .offset(x: 0, y: 8)
                                .foregroundColor(.white)
                                Text("\(product.quantity)")
                                    .font(Fonts.shared.getMediumFont(size: 20))
                                    .foregroundColor(.white)
                                Button {
                                    cart.addProduct(phone: product.phone)
                                } label: {
                                    Image(systemName: "plus")
                                        .frame(width: 10, height: 10)
                                }
                                .offset(x: 0, y: -8)
                                .foregroundColor(.white)
                            }
                        }
                        .padding(.trailing, 25)
                        Image(systemName: "trash")
                            .frame(width: 15, height: 16)
                            .foregroundColor(grayColor)
                    }
                    .padding(.trailing, 25)
                }
                Spacer()
                Rectangle()
                    .fill(.white)
                    .opacity(0.25)
                    .frame(height: 2)
                    .edgesIgnoringSafeArea(.horizontal)
                VStack (spacing: 12){
                    HStack {
                        Text("Total")
                            .foregroundColor(.white)
                            .font(Fonts.shared.getRegularFont(size: 15))
                        Spacer()
                        Text("\(cart.sum)")
                            .foregroundColor(.white)
                            .font(Fonts.shared.getRegularFont(size: 15))
                    }
                    HStack {
                        Text("Delivery")
                            .foregroundColor(.white)
                            .font(Fonts.shared.getRegularFont(size: 15))
                        Spacer()
                        Text(cart.delivery)
                            .foregroundColor(.white)
                            .font(Fonts.shared.getRegularFont(size: 15))
                    }
                    .padding(.bottom, 41)
                    Rectangle()
                        .fill(.white)
                        .opacity(0.25)
                        .frame(height: 2)
                        .edgesIgnoringSafeArea(.horizontal)
                    Button(action: {
                        print("button pressed")
                    }) {
                        HStack {
                            Text("Checkout")
                                .foregroundColor(.white)
                                .font(Fonts.shared.getBoldFont(size: 20))
                        }
                    }
                    .padding(.leading, 44)
                    .padding(.trailing, 44)
                    .frame(width: 326, height: 54)
                    .background(orangeColor)
                    .cornerRadius(10)
                }
                .padding()
                .frame(width: geometry.size.width)
            }
            .frame(height: geometry.size.height)
        }
    }
}

