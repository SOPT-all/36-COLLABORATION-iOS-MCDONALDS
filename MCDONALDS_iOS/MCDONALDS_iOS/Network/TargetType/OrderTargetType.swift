//
//  OrderTargetType.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/23/25.
//

import Foundation

enum OrderTargetType {
    case order
    case fetchRecentOrder
}

extension OrderTargetType: TargetType {
    var baseURL: String {
        return Environment.baseURL + "/api/v1/order"
    }
    
    var path: String {
        switch self {
        case .order:
            return ""
        case .fetchRecentOrder:
            return "/recent"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .order:
            return .post
        case .fetchRecentOrder:
            return .get
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .order:
            return .requestPlain
        case .fetchRecentOrder:
            return .requestPlain
        }
    }
    
    var headers: HeaderField {
        return .userId(2)
    }
}
