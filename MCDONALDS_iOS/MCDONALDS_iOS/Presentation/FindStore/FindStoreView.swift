//
//  FindStoreView.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/15/25.
//

import UIKit

import SnapKit
import Then

final class FindStoreView: BaseView {
    
    // MARK: - UI Properties

    private let filterContainerView = UIView()
    
    private let filterButton = UIButton(type: .system)
    
    let mcdriveButton = FilterButton("맥드라이브", isSelected: true)
    
    let twentyFourHourButton = FilterButton("24시간 영업")
    
    let parkingLotButton = FilterButton("주차장")
    
    
    // MARK: - UI Setting
    
    override func setStyle() {
        
        filterContainerView.do {
            $0.backgroundColor = .staticWhite
        }
        
        filterButton.do {
            $0.setImage(.iconMenu, for: .normal)
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .staticBlack
        }
    }
    
    override func setUI() {
        addSubviews(filterContainerView)
        
        filterContainerView.addSubviews(
            filterButton,
            mcdriveButton,
            twentyFourHourButton,
            parkingLotButton
        )
    }
    
    override func setLayout() {
        filterContainerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(46)
        }
        
        filterButton.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.leading.equalToSuperview().inset(19)
            $0.centerY.equalToSuperview()
        }
        
        mcdriveButton.snp.makeConstraints {
            $0.width.equalTo(78)
            $0.height.equalTo(30)
            $0.leading.equalTo(filterButton.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        
        twentyFourHourButton.snp.makeConstraints {
            $0.width.equalTo(86)
            $0.height.equalTo(30)
            $0.leading.equalTo(mcdriveButton.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        
        parkingLotButton.snp.makeConstraints {
            $0.width.equalTo(61)
            $0.height.equalTo(30)
            $0.leading.equalTo(twentyFourHourButton.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
    }
}
