//
//  Fonts.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 28.12.2022.
//

import SwiftUI


class Fonts {
    static let shared = Fonts()
    
    private init() {}
    
    //Weight-700
    func getBoldFont(size: CGFloat) -> Font {
        Font.custom("MarkPro-Bold", size: size)
    }
    
    //Weight-500
    func getMediumFont(size: CGFloat) -> Font {
        Font.custom("MarkPro-Medium", size: size)
    }
    
    //Weight-400
    func getRegularFont(size: CGFloat) -> Font {
        Font.custom("MarkPro-Regular", size: size)
    }
}
