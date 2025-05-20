//
//  MenuListResponseDTO.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import Foundation

struct MenuListResponseDTO: ResponseModelType {
    let menuList: [Menu]
}

struct Menu: ResponseModelType {
    let menuId: Int
    let menuName: String
    let menuImg: String
    let menuPrice: String
}
