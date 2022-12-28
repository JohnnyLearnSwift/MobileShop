//
//  MyCartView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import SwiftUI

struct MyCartView: View {
    @StateObject var viewModel: MyCartViewModel
    let blackColor = Colors.shared.black
    let orangeColor = Colors.shared.orange
    
    var body: some View {
        VStack (alignment: .leading){
            Text("My Cart")
                .font(Fonts.shared.getBoldFont(size: 35))
                .foregroundColor(blackColor)
                .padding(.leading, 42)
                .padding(.top, 40)
            GeometryReader { geometry in
                ScrollView {
                    ZStack (alignment: .topLeading){
                        Rectangle()
                            .frame(height: 690)
                            .foregroundColor(blackColor)
                            .cornerRadius(30)
                            .padding(.top, 49)
                        CartCardView()
                            .padding(.top, 129)
                            .padding(.leading, 23)
                    }
                }
                .frame(width: geometry.size.width)
            }
            
            
                
        }
        .environmentObject(viewModel)
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: LeftBarButtonView(width: 37, height: 37, cornerRadius: 10, image: Image(systemName: "chevron.left"), backgroundColor: blackColor, imageWidth: 7, imageHeight: 14, imageColor: .white),
                trailing: RightBarItemView(width: 37, height: 37, cornerRadius: 10, image: Image("WhitePin"), backgroundColor: orangeColor, imageWidth: 14, imageHeight: 18, imageColor: .white, text: "Add address", textColor: blackColor, textSize: 15)
            )
        
    }
}

//struct MyCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyCartView(viewModel: MyCartViewModel(cart: Cart()))
//    }
//}
