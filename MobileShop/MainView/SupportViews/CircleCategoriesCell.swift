//
//  CircleCategoriesCell.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import SwiftUI

struct CircleCategoriesCell: View {
    let cell: CircleCell
    let orangeColor = Colors.shared.orange
    let blackColor = Colors.shared.black
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(cell.isSelect ? orangeColor : .white)
                    .frame(width: 71, height: 71)
                    .shadow(radius: 2)
                Image(cell.image)
                    .renderingMode(.template)
                    .foregroundColor(cell.isSelect ? .white : .gray)
            }
            Text(cell.title)
                .font(Fonts.shared.getMediumFont(size: 15))
                .foregroundColor(cell.isSelect ? orangeColor : blackColor)
        }
    }
}

struct CircleCategoriesCell_Previews: PreviewProvider {
    static var previews: some View {
        CircleCategoriesCell(cell: CircleCell(title: "", image: "", isSelect: false))
    }
}
