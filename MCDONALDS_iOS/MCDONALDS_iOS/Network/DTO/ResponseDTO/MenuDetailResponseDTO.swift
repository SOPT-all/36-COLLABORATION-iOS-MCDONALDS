//
//  MenuDetailResponseDTO.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/21/25.
//

import Foundation

struct MenuDetailResponseDTO: ResponseModelType {
    let menuId: Int
    let menuName: String
    let singleImg: String
    let singlePrice: String
    let setImg: String
    let setPrice: String
}

