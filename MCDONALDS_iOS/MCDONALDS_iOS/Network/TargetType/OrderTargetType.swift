//
//  OrderTargetType.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/23/25.
//

import Foundation

enum OrderTargetType {
    case order
}

extension OrderTargetType: TargetType {
    var baseURL: String {
        return Environment.baseURL + "/api/v1/order"
    }
    
    var path: String {
        switch self {
        case .order:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .order:
            return .post
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .order:
            return .requestPlain
        }
    }
    
    var headers: HeaderField {
        switch self {
        case .order:
            return .userId(2)
        }
    }
}
