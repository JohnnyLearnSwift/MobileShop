//
//  CircleCategories.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import SwiftUI

struct CircleCategories: View {
    @State var cells = CircleDataManager.shared.cells
    @State var selected = 0
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Array(cells.enumerated()), id: \.element) { index, cell in
                        CircleCategoriesCell(cell: cell)
                            .onTapGesture {
                                switchCategory(index: index)
                            }
                    }
                }.padding()
            }.frame(height: 100)
        }
    }
    
    private func switchCategory(index: Int) {
        for i in 0..<cells.count {
            if cells[i].isSelect == true {
                cells[i].isSelect.toggle()
            }
        }
        cells[index].isSelect.toggle()
    }
}

struct CircleCategories_Previews: PreviewProvider {
    static var previews: some View {
        CircleCategories()
    }
}
