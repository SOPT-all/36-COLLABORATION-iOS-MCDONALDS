//
//  BaseResponseBody.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import Foundation

/// 공통 응답 DTO
struct BaseResponseBody<T: ResponseModelType>: ResponseModelType {
    let code: Int
    let message: String
    let data: T
}
