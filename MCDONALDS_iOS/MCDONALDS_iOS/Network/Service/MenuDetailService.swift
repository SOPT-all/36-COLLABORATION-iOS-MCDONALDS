//
//  MenuDetailService.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/21/25.
//

import Foundation

final class  MenuDetailService: BaseService<MenuDetailTargetType> {
    
    static let shared = MenuDetailService()
    private override init() {}
    
    func fetchMenuDetail(menuId: Int) async throws -> BaseResponseBody<MenuDetailResponseDTO>? {
        return try await request(with: .fetchMenuDetail(menuId: menuId))
    }
}
