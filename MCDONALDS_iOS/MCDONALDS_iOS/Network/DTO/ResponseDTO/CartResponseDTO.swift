//
//  CartResponseDTO.swift
//  MCDONALDS_iOS
//
//  Created by 김현우 on 5/23/25.
//
import Foundation

struct CartResponseDTO: ResponseModelType {
    let cartItems: [CartItemResponseDTO]
}

struct CartItemResponseDTO: ResponseModelType {
    let cartItemId: Int
    let amount: Int
    let isSet: Bool
    let price: Int
    let menuName: String
    let imageUrl: String
    let menuId: Int
}
