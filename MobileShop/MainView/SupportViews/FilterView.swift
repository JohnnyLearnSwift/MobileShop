//
//  FilterView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 28.12.2022.
//

import SwiftUI

struct FilterView: View {
    @Binding var isShow: Bool
    let blackColor = Colors.black
    let orangeColor = Colors.orange
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
                        CommonButton(image: Image(systemName: "xmark"), title: nil, foregroundColor: .white, width: 37, height: 37, backgroundColor: blackColor, imageWidth: nil, imageHeight: nil, cornerRadius: 10, font: nil) {
                            isShow.toggle()
                        }
                        Spacer()
                        Text("Filter options")
                            .font(Fonts.shared.getMediumFont(size: 18))
                            .foregroundColor(blackColor)
                        Spacer()
                        CommonButton(image: nil, title: "Done", foregroundColor: .white, width: 86, height: 37, backgroundColor: orangeColor, imageWidth: nil, imageHeight: nil, cornerRadius: 10, font: Fonts.shared.getMediumFont(size: 18)) {
                            isShow.toggle()
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
    let blackColor = Colors.black
    let grayColor = Colors.grayForChevron
    
//MARK: ???????????????? ?? ?????????????????? ??????, ???? ?????????? ???????????????? ?? main ???????????? ?????????????????? ????????????????
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            TextViewWithParams(text: title,
                               font: Fonts.shared.getBoldFont(size: 18),
                               color: blackColor)
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
                        TextViewWithParams(text: dropDownList[index],
                                           font: Fonts.shared.getRegularFont(size: 18),
                                           color: blackColor)
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
