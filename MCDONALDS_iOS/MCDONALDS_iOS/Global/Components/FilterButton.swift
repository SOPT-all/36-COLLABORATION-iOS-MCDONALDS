//
//  FilterButton.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/15/25.
//

import UIKit

final class FilterButton: UIButton {
    
    // MARK: - Properties
    
    private let cornerRadius: CGFloat = 15
    
    private let defaultBackgroundColor: UIColor = .staticWhite
    private let selectedBackgroundColor: UIColor = .mainYellow
    
    private let selectedBorderColor: UIColor = .mainDarkYellow
    private let defaultBorderColor: UIColor = .grayScale200
    
    override var isSelected: Bool {
        didSet {
            updateButtonStyle()
        }
    }
    
    // MARK: - Initializer
    
    init(_ title: String, isSelected: Bool = false) {
        super.init(frame: .zero)
        
        setButton(title, isSelected: isSelected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FilterButton {
    private func setButton(_ title: String, isSelected: Bool) {
        setTitle(title, for: .normal)
        setTitleColor(.staticBlack, for: .normal)
        titleLabel?.font = .pretendard(.captionReg11)
        backgroundColor = isSelected ? selectedBackgroundColor : defaultBackgroundColor
        setBorder(borderColor: isSelected ? selectedBorderColor : defaultBorderColor)
        setCornerRadius(cornerRadius)
    }
    
    private func updateButtonStyle() {
        backgroundColor = isSelected ? selectedBackgroundColor : defaultBackgroundColor
        setBorder(borderColor: isSelected ? selectedBorderColor : defaultBorderColor)
    }
}

