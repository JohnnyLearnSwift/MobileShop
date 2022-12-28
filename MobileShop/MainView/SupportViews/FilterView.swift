//
//  FilterView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 28.12.2022.
//

import SwiftUI

struct FilterView: View {
    @Binding var isShow: Bool
    let blackColor = Colors.shared.black
    let orangeColor = Colors.shared.orange
    let brands = ["Samsung", "Iphone", "Xiaomi"]
    let prices = ["$300 - $500", "$500 - $1000", "$1000 and more"]
    let sizes = ["4.5 to 5.5 inches", "5.5 to 7.5 inches", "7.5 and more"]
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .cornerRadius(30)
                    .frame(width: geometry.size.width, height: 375)
                    .foregroundColor(.white)
                    .shadow(radius: 1)
                VStack {
                    HStack {
                        Button {
                            isShow.toggle()
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .foregroundColor(.white)
                        .frame(width: 37, height: 37)
                        .background(blackColor)
                        .cornerRadius(10)
                        Spacer()
                        Text("Filter options")
                            .font(Fonts.shared.getMediumFont(size: 18))
                            .foregroundColor(blackColor)
                        Spacer()
                        Button {
                            isShow.toggle()
                        } label: {
                            Text("Done")
                                .foregroundColor(.white)
                                .font(Fonts.shared.getMediumFont(size: 18))
                                .frame(width: 86, height: 37)
                                .background(orangeColor)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.leading, 44)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                    Spacer()
                    DropDownMenu(dropDownList: brands, title: "Brand")
                    DropDownMenu(dropDownList: prices, title: "Price")
                    DropDownMenu(dropDownList: sizes, title: "Size")
                        .padding(.bottom, 44)
                }
            }
            
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isShow: .constant(true))
    }
}

struct DropDownMenu: View {
    let dropDownList: [String]
    let title: String
    @State var index = 0
    let blackColor = Colors.shared.black
    let grayColor = Colors.shared.grayForChevron
    
//MARK: Работает в отдельном вью, но когда добавляю в main менюхи перестают выпадать
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text(title)
                .font(Fonts.shared.getBoldFont(size: 18))
                .foregroundColor(blackColor)
                .padding(.leading, 46)
            Menu {
                ForEach(Array(dropDownList.enumerated()), id: \.offset) { index, element in
                    Button(element) {
                        self.index = index
                    }
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                        .frame(width: 337, height: 37)
                    HStack{
                        Text(dropDownList[index])
                            .foregroundColor(blackColor)
                            .font(Fonts.shared.getRegularFont(size: 18))
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(grayColor)
                            .frame(width: 16, height: 8)
                    }
                    .padding(.horizontal, 44)
                }
            }
        }
        

    }
}
