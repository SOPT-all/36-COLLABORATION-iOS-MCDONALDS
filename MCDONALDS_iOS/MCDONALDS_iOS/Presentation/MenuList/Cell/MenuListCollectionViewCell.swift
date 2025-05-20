//
//  MenuListCollectionViewCell.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class MenuListCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - UI Properties
    
    private let burgerImageView = UIImageView()
    
    private let titleLabel = UILabel()
    
    private let priceLabel = UILabel()
    
    private let separatorView = UIView()
    
    // MARK: - UI Setting
    
    override func setStyle() {
        burgerImageView.do {
            $0.image = .drinkZerocoke // 임시 이미지
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.text = "더블 1955® 버거" // 임시 타이틀
            $0.font = .pretendard(.bodyBold13)
            $0.textColor = .grayScale800
        }
        
        priceLabel.do {
            $0.text = "₩9,500 ~" // 임시 섭 타이틀
            $0.font = .pretendard(.bodyReg13)
            $0.textColor = .grayScale800
        }
        
        separatorView.do {
            $0.backgroundColor = .grayScale200
        }
    }
    
    override func setUI() {
        contentView.addSubviews(burgerImageView, titleLabel, priceLabel, separatorView)
    }
    
    override func setLayout() {
        burgerImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(21)
            $0.height.equalTo(54)
            $0.width.equalTo(69)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalTo(burgerImageView.snp.trailing).offset(10)
            $0.height.equalTo(22)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(burgerImageView.snp.trailing).offset(10)
            $0.height.equalTo(22)
        }
        
        separatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalToSuperview()
        }
    }
}

extension MenuListCollectionViewCell {
    func configure(_ menu: Menu) {
        if let imageURL = URL(string: menu.menuImg) {
            burgerImageView.kf.setImage(with: imageURL)
        }
        
        titleLabel.text = menu.menuName
        priceLabel.text = menu.menuPrice
    }
}
