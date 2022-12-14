//
//  HotSales.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 14.12.2022.
//

import SwiftUI

struct HotSales: View {
    @State private var index = 0
    
    var body: some View {
        VStack{
            TabView(selection: $index) {
                ForEach((0..<3), id: \.self) { index in
                    HotSalesCell()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .frame(height: 200)
    }
}

struct HotSales_Previews: PreviewProvider {
    static var previews: some View {
        HotSales()
    }
}
