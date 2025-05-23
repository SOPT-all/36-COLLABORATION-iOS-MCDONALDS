//
//  OrderService.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/23/25.
//

import Foundation

class OrderService: BaseService<OrderTargetType> {
    
    static let shared = OrderService()
    private override init() {}
    
    func order() async throws -> BaseResponseBody<EmptyResponseDTO>? {
        return try await request(with: .order)
    }
    
}
