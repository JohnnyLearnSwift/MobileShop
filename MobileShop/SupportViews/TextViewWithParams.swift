//
//  TextViewWithParams.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 02.01.2023.
//

import SwiftUI

struct TextViewWithParams: View {
    let text: String
    let font: Font
    let color: Color
    var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(color)
    }
}

struct TextViewTitleHStack: View {
    let leftTitle: String
    let rightTitle: String
    let blackColor = Colors.black
    let orangeColor = Colors.orange
    
    var body: some View {
        HStack {
            TextViewWithParams(text: leftTitle,
                               font: Fonts.shared.getBoldFont(size: 25),
                               color: blackColor)
                .padding(.leading)
            Spacer()
            TextViewWithParams(text: rightTitle,
                               font: Fonts.shared.getRegularFont(size: 15),
                               color: orangeColor)
                .padding(.trailing)
        }
    }
}
