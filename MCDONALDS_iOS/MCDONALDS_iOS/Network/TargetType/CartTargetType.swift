//
//  CartTargetType.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/21/25.
//

import Foundation

enum CartTargetType {
    case addToCart(CartRequestDTO)
}

extension CartTargetType: TargetType {
    var baseURL: String {
        Environment.baseURL + "/api/v1/cart"
    }
    
    var path: String {
        switch self {
        case .addToCart:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addToCart:
            return .post
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .addToCart(let reqeust):
            return .requestJSONEncodable(encodable: reqeust)
        }
    }
    
    var headers: HeaderField {
        return .userId(2)
    }
    
    
}
