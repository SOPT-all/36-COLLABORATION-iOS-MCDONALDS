//
//  BaseService.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import Foundation

class BaseService<Target: TargetType> {
    let provider = NetworkProvider<Target>()

    func request<T: ResponseModelType>(with target: Target) async throws -> BaseResponseBody<T> {
        
        // 1️⃣ urlRequest 생성
        let urlRequest = try provider.makeRequest(target)
        
        // 2️⃣ request 요청 로그 출력
        NetworkLogger.logRequest(urlRequest, target: target)
        
        do {
            // 3️⃣ 실제 네트워크 요청 수행
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            // 4️⃣ 응답 로그 출력
            NetworkLogger.logResponse(data: data, response: response, target: target)
            
            // 5️⃣ HTTP 응답 형식 확인
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            
            // 6️⃣ 상태 코드에 따른 예외 처리
            let statusCode = httpResponse.statusCode

            guard 200..<300 ~= statusCode else {
                if statusCode == 404 {
                    throw NetworkError.notFoundError
                } else if statusCode == 500 {
                    throw NetworkError.internalServerError
                } else {
                    throw NetworkError.responseError
                }
            }
            
            // 7️⃣ JSON 디코딩
            do {
                return try JSONDecoder().decode(BaseResponseBody<T>.self, from: data)
            } catch {
                throw NetworkError.responseDecodingError
            }
            
        } catch {
            // 8️⃣ 에러 로깅 & 에러 던짐
            NetworkLogger.logError(error)
            throw error
        }
    }
}
