//
//  ExpandedToppingEAView.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class ExpandedToppingEAView: UIView {
    
    private let toppingStackView = UIStackView()
    private let toppingData: [String] = [
        "양파",
        "양상추",
        "토마토",
        "아메리칸 치즈",
        "스트립 베이컨"
    ]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupLayout()
        setupToppingRows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(toppingStackView)
        toppingStackView.axis = .vertical
        toppingStackView.alignment = .fill
        toppingStackView.distribution = .fill
        toppingStackView.spacing = 0
    }
    
    private func setupLayout() {
        toppingStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupToppingRows() {
        for topping in toppingData {
            let container = UIView()
            
            let itemStack = UIStackView()
            itemStack.axis = .horizontal
            itemStack.alignment = .center
            itemStack.isLayoutMarginsRelativeArrangement = true
            itemStack.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 14)
            
            container.addSubview(itemStack)
            itemStack.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(48)
            }
            
            let label = UILabel()
            label.text = topping
            label.font = .pretendard(.bodyReg12)
            
            var eaCount = 0
            
            let eaLabel = UILabel()
            eaLabel.text = "\(eaCount)"
            eaLabel.font = .pretendard(.bodyMed13)
            eaLabel.textAlignment = .center
            eaLabel.snp.makeConstraints { make in
                make.width.equalTo(24)
            }
            
            let minusButton = UIButton()
            minusButton.setImage(UIImage(named: "icon-minus"), for: .normal)
            minusButton.addAction(UIAction(handler: { _ in
                if eaCount > 0 {
                    eaCount -= 1
                    eaLabel.text = "\(eaCount)"
                }
            }), for: .touchUpInside)
            
            let plusButton = UIButton()
            plusButton.setImage(UIImage(named: "icon-plus"), for: .normal)
            plusButton.addAction(UIAction(handler: { _ in
                eaCount += 1
                eaLabel.text = "\(eaCount)"
            }), for: .touchUpInside)
            
            let eaStack = UIStackView(arrangedSubviews: [minusButton, eaLabel, plusButton])
            eaStack.axis = .horizontal
            eaStack.alignment = .center
            eaStack.spacing = 16
            
            itemStack.addArrangedSubview(label)
            itemStack.addArrangedSubview(eaStack)
            
            let separator = UIView()
            separator.backgroundColor = .grayScale200
            container.addSubview(separator)
            separator.snp.makeConstraints { make in
                make.top.equalTo(itemStack.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
                make.bottom.equalToSuperview()
            }
            
            toppingStackView.addArrangedSubview(container)
        }
    }
}
