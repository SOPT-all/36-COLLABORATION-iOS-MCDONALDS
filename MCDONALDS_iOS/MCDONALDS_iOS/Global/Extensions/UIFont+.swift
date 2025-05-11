//
//  UIFont+.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/12/25.
//

import UIKit

enum PretendardTextStyles {
    case headBold29
    case headBold23
    case headBold16
    
    case bodyBold15
    case bodyBold14
    case bodyReg14
    case bodyBold13
    case bodyMed13
    case bodyReg13
    case bodyReg12
    
    case captionMed19
    case captionSemi16
    case captionMed16
    case captionReg13
    case captionReg12
    case captionReg11
    case captionBold11
}

extension UIFont {
    static func pretendard(_ style: PretendardTextStyles) -> UIFont {
        switch style {
        case .headBold29:
            return UIFont(name: "Pretendard-Bold", size: 29)!
        case .headBold23:
            return UIFont(name: "Pretendard-Bold", size: 23)!
        case .headBold16:
            return UIFont(name: "Pretendard-Bold", size: 16)!
            
        case .bodyBold15:
            return UIFont(name: "Pretendard-Bold", size: 15)!
        case .bodyBold14:
            return UIFont(name: "Pretendard-Bold", size: 14)!
        case .bodyReg14:
            return UIFont(name: "Pretendard-Regular", size: 14)!
        case .bodyBold13:
            return UIFont(name: "Pretendard-Bold", size: 13)!
        case .bodyMed13:
            return UIFont(name: "Pretendard-Medium", size: 13)!
        case .bodyReg13:
            return UIFont(name: "Pretendard-Regular", size: 13)!
        case .bodyReg12:
            return UIFont(name: "Pretendard-Regular", size: 12)!
            
        case .captionMed19:
            return UIFont(name: "Pretendard-Medium", size: 19)!
        case .captionSemi16:
            return UIFont(name: "Pretendard-SemiBold", size: 16)!
        case .captionMed16:
            return UIFont(name: "Pretendard-Medium", size: 16)!
        case .captionReg13:
            return UIFont(name: "Pretendard-Regular", size: 13)!
        case .captionReg12:
            return UIFont(name: "Pretendard-Regular", size: 12)!
        case .captionReg11:
            return UIFont(name: "Pretendard-Regular", size: 11)!
        case .captionBold11:
            return UIFont(name: "Pretendard-Bold", size: 11)!
        }
    }
}
