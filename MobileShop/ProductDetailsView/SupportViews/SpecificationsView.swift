//
//  SpecificationsView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 23.12.2022.
//

import SwiftUI

struct SpecificationsView: View {
    let viewModel: ProductDetailsViewModel
    let blackColor = Colors.black
    let grayColor = Colors.grayTextSettings
    let orangeColor = Colors.orange
    let list = ["Shop", "Details", "Features"]
    var index = 0
    var rating: Int {
        Int(viewModel.rating)
    }
    var colors: [String] {
        viewModel.color
    }
    var capacity: [String] {
        viewModel.capacity
    }
    var body: some View {
        ZStack (alignment: .top) {
            RoundedRectangle(cornerRadius: 30)
                .shadow(radius: 1)
                .frame(height: 471)
                .foregroundColor(.white)
            VStack {
                HStack {
                    Text(viewModel.title)
                        .font(Fonts.shared.getMediumFont(size: 24))
                        .foregroundColor(blackColor)
                    Spacer()
                    RightBarItemView(width: 37, height: 33, cornerRadius: 10, image: Image(systemName: "heart"), backgroundColor: blackColor, imageWidth: 14, imageHeight: 13, imageColor: .white, text: "", textColor: .white, textSize: 0)
                }
                .padding(.leading, 38)
                .padding(.trailing, 37)
                .padding(.top, 28)
                HStack {
                    ForEach(0 ..< rating) { star in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    ForEach(rating ..< 5) { star in
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                    Spacer()
                }
                .padding(.leading, 38)
                .padding(.top, 7)
                HStack {
                    ForEach(Array(list.enumerated()), id: \.element) { index, category in
                        VStack {
                            Text(category)
                                .font(isEqual(index: index) ? Fonts.shared.getBoldFont(size: 20) : Fonts.shared.getRegularFont(size: 20))
                                .foregroundColor(isEqual(index: index) ? blackColor : .black)
                                .opacity(isEqual(index: index) ? 1 : 0.5)
                            RoundedRectangle(cornerRadius: 2)
                                .frame(height: 2)
                                .foregroundColor(isEqual(index: index) ? orangeColor : .clear)
                                .offset(x: 0, y: -10)
                        }
                        if index + 1 != list.count {
                            Spacer()
                        }
                    }
                }
                .padding(.leading, 38)
                .padding(.trailing, 37)
                .padding(.top, 32)
                HStack (alignment: .bottom){
                    SpecificationOption(image: Image(systemName: "cpu"), width: 28, height: 28, text: viewModel.CPU)
                    Spacer()
                    SpecificationOption(image: Image(systemName: "camera"), width: 28, height: 22, text: viewModel.camera)
                    Spacer()
                    SpecificationOption(image: Image(systemName: "opticaldiscdrive"), width: 28, height: 21, text: viewModel.ssd)
                    Spacer()
                    SpecificationOption(image: Image(systemName: "sdcard"), width: 19, height: 22, text: viewModel.sd)
                }
                .padding(.leading, 38)
                .padding(.trailing, 37)
                .padding(.top, 33)
                HStack {
                    Text("Select color and capacity")
                        .foregroundColor(blackColor)
                        .font(Fonts.shared.getMediumFont(size: 16))
                        .padding(.leading, 38)
                        .padding(.top, 29)
                    Spacer()
                }
                HStack {
                    HStack {
                        ForEach(Array(colors.enumerated()), id: \.element) { index, color in
                            ZStack {
                                Circle()
                                    .frame(width: 39, height: 39)
                                    .foregroundColor(Color(hex: color))
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .frame(width: 17, height: 12)
                                    .foregroundColor(isEqual(index: index) ? .white : .clear)
                            }
                            .padding(.trailing, 18)
                        }
                    }
                    Spacer()
                    HStack {
                        ForEach(Array(capacity.enumerated()), id: \.element) { index, capacity in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 71, height: 30)
                                    .foregroundColor(isEqual(index: index) ? orangeColor : .clear)
                                Text(capacity)
                                    .font(Fonts.shared.getBoldFont(size: 13))
                                    .foregroundColor(isEqual(index: index) ? .white : Color(hex: "8d8d8d"))
                            }
                        }
                    }
                }
                .padding(.leading, 35)
                .padding(.trailing, 40)
                Button(action: {
                        print("button pressed")
                }) {
                    HStack {
                        Text("Add to Cart")
                            .foregroundColor(.white)
                            .font(Fonts.shared.getBoldFont(size: 20))
                            .padding(.leading, 45)
                        Spacer()
                        Text("$\(viewModel.price)")
                            .foregroundColor(.white)
                            .font(Fonts.shared.getBoldFont(size: 20))
                            .padding(.trailing, 38)
                    }
                 }
                .frame(width: 355, height: 54)
                .background(orangeColor)
                .cornerRadius(10)
                
                
            }
        }
    }
    private func isEqual(index: Int) -> Bool {
        if index == self.index {
            return true
        } else {
            return false
        }
    }
    
    struct SpecificationOption: View {
        let image: Image
        let width: CGFloat
        let height: CGFloat
        let color = Colors.grayTextSettings
        let text: String
        
        var body: some View {
            VStack {
                image
                    .foregroundColor(color)
                    .frame(width: width, height: height)
                Text(text)
                    .foregroundColor(color)
                    .font(Fonts.shared.getRegularFont(size: 11))
                
            }
        }
    }
}


struct SpecificationsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificationsView(viewModel: ProductDetailsViewModel(phoneProperties: PhoneProperties()))
    }
}
