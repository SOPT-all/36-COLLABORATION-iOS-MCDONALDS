//
//  MenuTargetType.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import Foundation

enum MenuTargetType {
    case fetchMenuList
    case fetchMenuDetail(menuId: Int)
}

extension MenuTargetType: TargetType {
    var baseURL: String {
        return Environment.baseURL + "/api/v1/menu"
    }
    
    var path: String {
        switch self {
        case .fetchMenuList:
            return ""
        case .fetchMenuDetail(menuId: let menuId):
            return "/\(menuId)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMenuList:
            return .get
        case .fetchMenuDetail:
            return .get
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .fetchMenuList:
            return .requestPlain
        case .fetchMenuDetail:
            return .requestPlain
        }
    }
    
    var headers: HeaderField {
        return .userId(2)
    }
}
