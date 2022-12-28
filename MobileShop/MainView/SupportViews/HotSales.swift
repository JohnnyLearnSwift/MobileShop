//
//  HotSales.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 14.12.2022.
//

import SwiftUI

struct HotSales: View {
    @StateObject var phones: MainViewModel
    @State private var index = 0
    
    var body: some View {
        VStack{
            TabView(selection: $index) {
                ForEach(phones.phones.home_store ?? [], id: \.self) { phone in
                    HotSalesCell(phoneCell: phone, height: 200)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .frame(height: 200)
    }
}

struct HotSales_Previews: PreviewProvider {
    static var previews: some View {
        HotSales(phones: MainViewModel())
    }
}
