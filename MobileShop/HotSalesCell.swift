//
//  HotSalesCell.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 14.12.2022.
//

import SwiftUI

struct HotSalesCell: View {
    var body: some View {
        Rectangle()
            .fill(Color.pink)
            .frame(height: 200)
            .border(Color.black)
            .padding()
    }
}

struct HotSalesCell_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesCell()
    }
}
