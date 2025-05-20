//
//  LocationFloatingView.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/19/25.
//

import UIKit

import SnapKit
import Then

final class LocationFloatingView: BaseView {
    
    // MARK: - UI Properties
    
    private let conjestionLabel = UILabel()
    
    private let titleLabel = UILabel()
    
    private let subTitle = UILabel()
    
    private let hoursLabel = UILabel()
    
    private let informationButton = UIButton()
    
    let selectButton = McdonaldsButton("매장 선택하기", type: .roundedYellow)
    
    // MARK: - UI Setting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .staticWhite
            $0.setCornerRadius(8)
        }
        
        conjestionLabel.do {
            $0.text = "혼잡"
            $0.font = .pretendard(.captionReg11)
            $0.textColor = .pointRed
            $0.textAlignment = .center
            $0.backgroundColor = .pointLightRed
            $0.setCornerRadius(4)
        }
        
        titleLabel.do {
            $0.text = "중계역점 (상계 백병원 앞) · 1.2km"
            $0.font = .pretendard(.bodyBold14)
            $0.textColor = .staticBlack
        }
        
        subTitle.do {
            $0.text = "노원구 동일로 1341(상계동), 서울특별시"
            $0.font = .pretendard(.captionReg12)
            $0.textColor = .grayScale600
        }
        
        hoursLabel.do {
            $0.text = "24시간"
            $0.font = .pretendard(.captionReg12)
            $0.textColor = .grayScale800
        }
        
        informationButton.do {
            $0.setTitle("매장 정보", for: .normal)
            $0.setTitleColor(.grayScale700, for: .normal)
            $0.titleLabel?.font = .pretendard(.captionReg12)
            $0.setImage(.iconLeft, for: .normal)
            $0.tintColor = .grayScale700
            $0.semanticContentAttribute = .forceRightToLeft

        }
    }
    
    override func setUI() {
        addSubviews(
            conjestionLabel,
            titleLabel,
            subTitle,
            hoursLabel,
            informationButton,
            selectButton
        )
    }
    
    override func setLayout() {
        conjestionLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(16)
            $0.height.equalTo(22)
            $0.width.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(conjestionLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        subTitle.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        hoursLabel.snp.makeConstraints {
            $0.top.equalTo(subTitle.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        informationButton.snp.makeConstraints {
            $0.top.equalTo(hoursLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        selectButton.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
    }
}
