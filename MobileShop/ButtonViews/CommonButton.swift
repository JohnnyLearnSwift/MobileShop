//
//  CommonButton.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 29.12.2022.
//

import SwiftUI

struct CommonButton: View {
    let image: Image?
    let title: String?
    let foregroundColor: Color
    let width: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let font: Font?
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            if image != nil {
                image
            }
            if let text = title {
                Text(text)
                    .font(font)
            }
        }
        .foregroundColor(foregroundColor)
        .frame(width: width, height: height)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}
