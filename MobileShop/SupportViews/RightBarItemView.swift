//
//  RightBarItemView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 23.12.2022.
//

import SwiftUI

struct RightBarItemView: View {
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let image: Image
    let backgroundColor: Color
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    let imageColor: Color
    let text: String
    let textColor: Color
    let textSize: CGFloat
    
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(textColor)
                .font(Fonts.shared.getMediumFont(size: textSize))
            ZStack {
                Rectangle()
                    .frame(width: width, height: height)
                    .cornerRadius(cornerRadius)
                    .foregroundColor(backgroundColor)
                image
                    .resizable()
                    .foregroundColor(imageColor)
                    .frame(width: imageWidth, height: imageHeight)
            }
        }
        
    }
}

struct RightBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        RightBarItemView(width: 0, height: 0, cornerRadius: 0, image: Image(""), backgroundColor: .white, imageWidth: 0, imageHeight: 0, imageColor: .white, text: "", textColor: .white, textSize: 0)
    }
}
