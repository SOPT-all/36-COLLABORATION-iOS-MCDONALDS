//
//  CartTargetType.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/21/25.
//

import Foundation

enum CartTargetType {
    case addToCart(CartRequestDTO)
    case fetchCart
    case updateCart(cartItemID: Int, requestBody: UpdateCartRequestDTO)
}

extension CartTargetType: TargetType {
    var baseURL: String {
        Environment.baseURL + "/api/v1/cart"
    }
    
    var path: String {
        switch self {
        case .addToCart:
            return ""
        case .fetchCart:
            return ""
        case .updateCart(cartItemID: let cartItemID, _):
            return "\(cartItemID)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addToCart:
            return .post
        case .fetchCart:
            return .get
        case .updateCart:
            return .patch
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .addToCart(let reqeustBody):
            return .requestJSONEncodable(encodable: reqeustBody)
        case .fetchCart:
            return .requestPlain
        case .updateCart(_, requestBody: let requestBody):
            return .requestJSONEncodable(encodable: requestBody)
        }
    }
    
    var headers: HeaderField {
        return .userId(2)
    }
    
    
}
