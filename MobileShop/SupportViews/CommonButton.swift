//
//  CommonButton.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 29.12.2022.
//

import SwiftUI

struct CommonButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let image: Image?
    let title: String?
    let foregroundColor: Color
    let width: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    let imageWidth: CGFloat?
    let imageHeight: CGFloat?
    let cornerRadius: CGFloat
    let font: Font?
    var action: (() -> Void)?
    
    var body: some View {
        if let actionButton = action {
            Button(action: actionButton) {
                if let image = image {
                    image
                        .resizable()
                        .frame(width: imageWidth, height: imageHeight)
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
        } else {
            Button(action: dismissAction) {
                if let image = image {
                    image
                        .resizable()
                        .frame(width: imageWidth, height: imageHeight)
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
    
    private func dismissAction() {
        self.presentationMode.wrappedValue.dismiss()
    }
}
