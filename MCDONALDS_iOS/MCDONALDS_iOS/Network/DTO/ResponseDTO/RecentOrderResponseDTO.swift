//
//  RecentOrderResponseDTO.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/23/25.
//

import Foundation

struct RecentOrderResponseDTO: ResponseModelType {
    let recentItems: [RecentItem]
}

struct RecentItem: ResponseModelType {
    let menuId: Int
    let menuName: String
    let menuImg: String
    let menuPrice: Int
}
