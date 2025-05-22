//
//  CartRequestDTO.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/21/25.
//

import Foundation

struct CartRequestDTO: RequestModelType {
    var isSet: Bool
    var menuId: Int
    var amount: Int
}
