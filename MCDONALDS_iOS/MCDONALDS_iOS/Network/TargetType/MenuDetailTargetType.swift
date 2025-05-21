//
//  MenuDetailTargetType.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/21/25.
//

import Foundation

enum MenuDetailTargetType {
    case fetchMenuDetail(menuId: Int)
}

extension MenuDetailTargetType: TargetType {
    var baseURL: String {
            return Environment.baseURL + "/api/v1/menu"
    }
    
    var path: String {
        switch self {
        case .fetchMenuDetail(menuId: let menuId):
            return "/\(menuId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMenuDetail(menuId: let menuId):
            return .get
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .fetchMenuDetail(menuId: let menuId):
            return .requestPlain
        }
    }
    
    var headers: HeaderField {
        return .userId(2)
    }
}
