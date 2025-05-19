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
    
    let mapImageView = UIImageView()
    
    let locationPinButton = UIButton()
    
    private let locationStackView = UIStackView()
    
    private let nowLocationButton = UIButton()
    
    let locationFloatingView = LocationFloatingView()
    
    
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
        
        mcdriveButton.do {
            $0.tag = 0
        }
        
        twentyFourHourButton.do {
            $0.tag = 1
        }
        
        parkingLotButton.do {
            $0.tag = 2
        }
        
        mapImageView.do {
            $0.image = .map
            $0.contentMode = .scaleAspectFill
            $0.isUserInteractionEnabled = true
        }
        
        locationPinButton.do {
            $0.setImage(.iconMclocation, for: .normal)
            $0.contentMode = .scaleAspectFit
        }
        
        locationStackView.do {
            $0.axis = .vertical
            $0.spacing = 8
            $0.alignment = .leading
            $0.distribution = .fill
        }
        
        nowLocationButton.do {
            $0.setImage(.iconLocation, for: .normal)
            $0.setCornerRadius(22)
            $0.backgroundColor = .staticWhite
        }
        
        locationFloatingView.do {
            $0.isHidden = true
        }
    }
    
    override func setUI() {
        addSubviews(filterContainerView, mapImageView)
        
        filterContainerView.addSubviews(
            filterButton,
            mcdriveButton,
            twentyFourHourButton,
            parkingLotButton
        )
        
        mapImageView.addSubviews(locationPinButton, locationStackView)
        
        locationStackView.addArrangedSubviews(nowLocationButton, locationFloatingView)
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
        
        mapImageView.snp.makeConstraints {
            $0.top.equalTo(filterContainerView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        locationPinButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(filterContainerView.snp.bottom).offset(186)
            $0.height.equalTo(30)
            $0.width.equalTo(26)
        }
        
        nowLocationButton.snp.makeConstraints {
            $0.size.equalTo(44)
        }
        
        locationFloatingView.snp.makeConstraints {
            $0.width.equalTo(345)
            $0.height.equalTo(210)
        }
        
        locationStackView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
    }
}
