//
//  McdonaldsButton.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/13/25.
//

import UIKit

import SnapKit
import Then

/// 맥도날드 버튼 컴포넌트입니다.
final class McdonaldsButton: UIButton {
    
    // MARK: - Properties

    private let cornerRadius: CGFloat = 4
    private let borderColor: UIColor = .grayScale200
    
    // MARK: - Initializer
    
    init(_ title: String, type: McdonalsButtonType) {
        super.init(frame: .zero)
        
        setButton(title, type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions

extension McdonaldsButton {
    private func setButton(_ title: String, type: McdonalsButtonType) {
        setTitle(title, for: .normal)
        setTitleColor(.grayScale800, for: .normal)
        titleLabel?.font = .pretendard(.bodyReg13)
        backgroundColor = type.backgroundColor
        clipsToBounds = true
        
        if type.hasRoundedCorners {
            setCornerRadius(cornerRadius)
        }
        
        if type.hasBorder {
            setButtonBorder()
        }
    }
    
    private func setButtonBorder() {
        let borderView = UIView()
        
        borderView.do {
            $0.backgroundColor = .clear
            $0.isUserInteractionEnabled = false
            $0.setBorder(borderColor: borderColor)
        }
        
        addSubview(borderView)
        
        borderView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(-1)
        }
    }
}

extension McdonaldsButton {
    
    /// 맥도날드 버튼 컴포넌트에 사용되는 enum입니다
    /// 1. plainYellow - 기본 노란 버튼
    /// 2. roundedYellow - 둥근 노란 버튼
    /// 3. outlinedYellow - 외각선 노란 버튼
    /// 4. outlinedWhite - 외각선 흰 버튼
    enum McdonalsButtonType {
        case plainYellow
        case roundedYellow
        case outlinedYellow
        case outlinedWhite
        
        var backgroundColor: UIColor {
            switch self {
            case .plainYellow, .roundedYellow, .outlinedYellow:
                return .mainYellow
            case .outlinedWhite:
                return .staticWhite
            }
        }
        
        var hasRoundedCorners: Bool {
            switch self {
            case .plainYellow, .outlinedYellow, .outlinedWhite:
                return false
            case .roundedYellow:
                return true
            }
        }
        
        var hasBorder: Bool {
            switch self {
            case .plainYellow, .roundedYellow:
                return false
            case .outlinedYellow, .outlinedWhite:
                return true
            }
        }
    }
}
