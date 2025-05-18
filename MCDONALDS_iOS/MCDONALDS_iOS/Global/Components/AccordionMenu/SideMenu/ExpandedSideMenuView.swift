//
//  ExpandedSideMenuView.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class ExpandedSideMenuView: UIView {
    private let menuImageView = UIImageView()
    private let menuNameLabel = UILabel()
    private let menuStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setStyle()
        setLayout()
        addSubview(menuStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        menuImageView.do {
            $0.image = UIImage(named: "side-coleslaw")
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
        }
        
        menuNameLabel.do {
            $0.font = .pretendard(.bodyReg14)
            $0.text = "코울슬로"
        }
        
        menuStackView.do {
            $0.axis = .horizontal
            $0.spacing = 32
            $0.addArrangedSubviews(menuImageView, menuNameLabel)
        }
    }
    
    private func setLayout() {
        menuImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.width.height.equalTo(40)
        }
        
        menuNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(menuImageView.snp.centerY)
        }
        menuStackView.snp.makeConstraints{
            $0.height.equalTo(48)
        }
    }
}
