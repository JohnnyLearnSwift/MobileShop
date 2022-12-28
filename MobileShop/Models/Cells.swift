//
//  Cells.swift
//  MobileShop
//
//  Created by Eugenie Tyan on 15.12.2022.
//

import Foundation

struct CircleCell: Hashable {
    
    let title: String
    let image: String
    var isSelect: Bool
}

class CircleDataManager {
    static let shared = CircleDataManager()
    
    private init() {}
    
    let cells = [CircleCell(title: "Phones", image: "Phones", isSelect: true),
                 CircleCell(title: "Computer", image: "Computer", isSelect: false),
                 CircleCell(title: "Health", image: "Health", isSelect: false),
                 CircleCell(title: "Books", image: "Books", isSelect: false),
                 CircleCell(title: "Tab", image: "Phones", isSelect: false),
                 CircleCell(title: "PC", image: "Computer", isSelect: false),
                 CircleCell(title: "Smoke", image: "Health", isSelect: false),
                 CircleCell(title: "Electronic", image: "Books", isSelect: false)]
}
