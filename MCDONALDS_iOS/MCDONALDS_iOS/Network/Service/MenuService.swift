//
//  MenuService.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import Foundation

final class MenuService: BaseService<MenuTargetType> {
    
    static let shared = MenuService()
    private override init() {}
    
    func fetchMenuList() async throws -> BaseResponseBody<MenuListResponseDTO>? {
        return try await request(with: .fetchMenuList)
    }
}
