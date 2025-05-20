//
//  MenuListView.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import UIKit

import SnapKit
import Then

final class MenuListView: BaseView {
    
    // MARK: - UI Properties
    
    let newMenuButton = FilterButton("신메뉴", isSelected: true)
    
    let recommendButton = FilterButton("추천메뉴")
    
    let crispyButton = FilterButton("맥크리스피")
    
    let bulgogiButton = FilterButton("불고기")
    
    let cheeseButton = FilterButton("치즈")
    
    private let filterScrollView = UIScrollView()
    
    private let filterContainerView = UIView()
    
    let menuListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - UI Setting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .staticWhite
        }
        
        filterScrollView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    override func setUI() {
        addSubviews(filterScrollView, menuListCollectionView)
        
        filterScrollView.addSubview(filterContainerView)
        
        filterContainerView.addSubviews(
            newMenuButton,
            recommendButton,
            crispyButton,
            bulgogiButton,
            cheeseButton
        )
    }
    
    override func setLayout() {
        filterScrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(46)
        }
        
        filterContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
            $0.trailing.equalTo(cheeseButton.snp.trailing).offset(19)
        }
        
        newMenuButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(19)
            $0.height.equalTo(30)
            $0.width.equalTo(61)
        }
        
        recommendButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(newMenuButton.snp.trailing).offset(8)
            $0.height.equalTo(30)
            $0.width.equalTo(71)
        }
        
        crispyButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(recommendButton.snp.trailing).offset(8)
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
        
        bulgogiButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(crispyButton.snp.trailing).offset(8)
            $0.height.equalTo(30)
            $0.width.equalTo(61)
        }
        
        cheeseButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(bulgogiButton.snp.trailing).offset(8)
            $0.height.equalTo(30)
            $0.width.equalTo(52)
        }
        
        menuListCollectionView.snp.makeConstraints {
            $0.top.equalTo(filterContainerView.snp.bottom)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }
}
