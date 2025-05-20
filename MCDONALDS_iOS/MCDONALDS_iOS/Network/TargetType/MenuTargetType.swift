//
//  MenuTargetType.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import Foundation

enum MenuTargetType {
    case fetchMenuList
}

extension MenuTargetType: TargetType {
    var baseURL: String {
        return Environment.baseURL + "/api/v1/menu"
    }
    
    var path: String {
        switch self {
        case .fetchMenuList:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMenuList:
            return .get
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .fetchMenuList:
            return .requestPlain
        }
    }
    
    var headers: HeaderField {
        return .userId(1)
    }
}
