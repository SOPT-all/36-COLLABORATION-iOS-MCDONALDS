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
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addToCart:
            return .post
        case .fetchCart:
            return .get
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .addToCart(let reqeust):
            return .requestJSONEncodable(encodable: reqeust)
        case .fetchCart:
            return .requestPlain
        }
    }
    
    var headers: HeaderField {
        return .userId(2)
    }
    
    
}
