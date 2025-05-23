//
//  BottomSheetView.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/23/25.
//

import UIKit

import SnapKit
import Then

final class BottomSheetView: BaseView {
    
    // MARK: - UI Properties
    
    let titleLabel = UILabel()
    
    let backButton = UIButton(type: .system)
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    let burgerMenuView = BurgerMenuView()
    
    private let sideMenuView = SideMenuView()
    
    private let beverageMenuView = BeverageMenuView()
    
    // MARK: - UI Setting
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "더블 1955 버거"
            $0.font = .pretendard(.bodyBold15)
            $0.textColor = .staticBlack
        }
        
        backButton.do {
            $0.setImage(.iconClose, for: .normal)
            $0.tintColor = .staticBlack
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            backButton,
            scrollView
        )
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            burgerMenuView,
            sideMenuView,
            beverageMenuView
        )
    }
    
    override func setLayout() {
        self.do {
            $0.backgroundColor = .staticWhite
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.equalToSuperview().inset(28)
            $0.height.equalTo(22)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(27)
            $0.size.equalTo(24)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalTo(beverageMenuView.snp.bottom).offset(20)
        }
        
        burgerMenuView.snp.makeConstraints{
            $0.top.equalTo(scrollView.snp.top)
            $0.horizontalEdges.equalToSuperview().inset(28)
        }
        
        sideMenuView.snp.makeConstraints {
            $0.top.equalTo(burgerMenuView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(28)
        }
        
        beverageMenuView.snp.makeConstraints {
            $0.top.equalTo(sideMenuView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(28)
        }
    }
    
}
