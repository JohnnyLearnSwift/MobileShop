//
//  BottomBarView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 21.12.2022.
//

import SwiftUI

struct BottomBarView: View {
    @StateObject var mainViewModel: MainViewModel
    let width = UIScreen.main.bounds.width
    let blackColor = Colors.black
    let orangeColor = Colors.orange
    let whiteColor = Color.white
    let clearColor = Color.clear
    var goodsCount: Int {
        mainViewModel.cart.basket?.count ?? 0
    }
    var isCartEmpty: Bool {
        return goodsCount > 0 ? false : true
    }
    
    var body: some View {
        ZStack (alignment: .leading){
            Rectangle()
                .frame(width: width, height: 72)
                .foregroundColor(blackColor)
                .cornerRadius(30)
            Circle()
                .frame(width: 8, height: 8)
                .offset(x: 68, y: 0)
                .foregroundColor(.white)
            TextViewWithParams(text: "Explorer",
                               font: Fonts.shared.getBoldFont(size: 15),
                               color: whiteColor)
                .offset(x: 83, y: 0)
            
            ZStack {
                NavigationLink(destination: MyCartView(viewModel: MyCartViewModel(cart: mainViewModel.cart))) {
                    Image(systemName: "bag")
                        .foregroundColor(whiteColor)
                        .frame(width: 18, height: 18)
                }
                
                
                ZStack {
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(isCartEmpty ? clearColor : orangeColor)
                    TextViewWithParams(text: "\(goodsCount)",
                                       font: Fonts.shared.getBoldFont(size: 7),
                                       color: isCartEmpty ? clearColor : whiteColor)
                }
                .offset(x: 9, y: -9)
                
            }
            .offset(x: 189, y: 0)
            Image(systemName: "heart")
                .foregroundColor(whiteColor)
                .frame(width: 19, height: 17)
                .offset(x: 259, y: 0)
            Image(systemName: "person")
                .foregroundColor(whiteColor)
                .frame(width: 17, height: 17)
                .offset(x: 330, y: 0)
        }
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView(mainViewModel: MainViewModel())
    }
}
