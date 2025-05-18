//
//  ExpandedBeverageMenuView.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class ExpandedBeverageMenuView: UIView {
    private let menuStackView = UIStackView()
    
    private let beverageData: [(image: UIImage?, name: String)] = [
        (UIImage(named: "drink-mango peach ice tea"), "망고 피치 아이스티"),
        (UIImage(named: "drink-peach ice tea"), "피치 아이스티"),
        (UIImage(named: "drink-coke"), "코카 콜라"),
        (UIImage(named: "drink-sprite"), "스프라이트"),
        (UIImage(named: "drink-fanta"), "환타"),
        (UIImage(named: "drink-zerocoke"), "코카 콜라 제로")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews(menuStackView)
        
        setStyle()
        setLayout()
        setupBeverageRows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        menuStackView.do {
            $0.axis = .vertical
            $0.spacing = 8
            $0.alignment = .fill
        }
    }
    
    private func setLayout() {
        menuStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    private func setupBeverageRows() {
        for (index, beverage) in beverageData.enumerated() {
            let container = UIView()
            
            let itemStack = UIStackView()
            itemStack.axis = .horizontal
            itemStack.spacing = 12
            itemStack.alignment = .center
            itemStack.isLayoutMarginsRelativeArrangement = true
            itemStack.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
            
            let imageView = UIImageView()
            imageView.image = beverage.image
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints {
                $0.width.height.equalTo(40)
            }
            
            let label = UILabel()
            label.text = beverage.name
            label.font = .pretendard(.bodyReg12)
            
            itemStack.addArrangedSubview(imageView)
            itemStack.addArrangedSubview(label)
            
            container.addSubview(itemStack)
            itemStack.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(48)
            }
            
            if index < beverageData.count - 1 {
                let separator = UIView()
                separator.backgroundColor = .grayScale200
                container.addSubview(separator)
                
                separator.snp.makeConstraints {
                    $0.top.equalTo(itemStack.snp.bottom)
                    $0.leading.equalToSuperview()
                    $0.trailing.equalToSuperview()
                    $0.height.equalTo(1)
                    $0.bottom.equalToSuperview()
                }
            } else {
                itemStack.snp.makeConstraints {
                    $0.bottom.equalToSuperview()
                }
            }
            
            menuStackView.addArrangedSubview(container)
        }
    }
}
