//
//  CarouselView.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 23.12.2022.
//

import SwiftUI

struct CarouselView: View {
    var images: [String]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images, id: \.self) { index in
                        GeometryReader { proxy in
                            VStack {
                                Spacer()
                                AsyncImage(url: URL(string: index)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Image(systemName: "xmark.shield")
                                }
                                .frame(width: UIScreen.main.bounds.width - 100, height: 349)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(lineWidth: 1)
                                        .fill(Color.secondary)
                                )
                                .cornerRadius(20)
                                .opacity(Double(getOpacity(proxy: proxy)))
                                .scaleEffect(CGSize(width: 1, height: getScalledValue(proxy: proxy)))
                                
                                Spacer()
                            }
                            
                        }
                        .frame(width: UIScreen.main.bounds.width - 100, height: 400)
                    }
                }
                .padding()
                
            }
            
        }
    }
    
    func getScalledValue(proxy: GeometryProxy) -> CGFloat {
        let x = proxy.frame(in: .global).minX
        let value = abs(x-32)
        if  value < 150 {
            //print(value)
            let scaleValue = 1 + (150 - value) / 700
            //print(scaleValue)
            return scaleValue
        }
        return 1
    }
    
    func getOpacity(proxy: GeometryProxy) -> CGFloat {
        let x = proxy.frame(in: .global).minX
        let value = abs(x-32)
        if  value > 150 {
            let scaleValue = 1 - (value / 400)
            return scaleValue
        }
        return 1
    }
}
