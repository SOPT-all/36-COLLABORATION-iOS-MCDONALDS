//
//  CartService.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/21/25.
//

import Foundation

final class CartService: BaseService<CartTargetType> {
    
    static let service = CartService()
        
    private override init() {}
    
    struct EmptyResponse: ResponseModelType {} 

    func addToCart(with request: CartRequestDTO) async throws -> BaseResponseBody<EmptyResponse> {
        return try await self.request(with: .addToCart(request))
    }
    
    func fetchCart() async throws -> BaseResponseBody<CartResponseDTO>? {
        return try await self.request(with: .fetchCart)
    }
    
    func updateCart(cartItemID: Int, requestBody: UpdateCartRequestDTO) async throws -> BaseResponseBody<EmptyResponse>? {
        return try await self.request(with: .updateCart(cartItemID: cartItemID, requestBody: requestBody))
    }
}
