//
//  LeftBarButtonView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 23.12.2022.
//

import SwiftUI

struct LeftBarButtonView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let image: Image
    let backgroundColor: Color
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    let imageColor: Color
    
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
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

struct LeftBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LeftBarButtonView(width: 0, height: 0, cornerRadius: 0, image: Image(""), backgroundColor: .white, imageWidth: 0, imageHeight: 0, imageColor: .white)
    }
}
