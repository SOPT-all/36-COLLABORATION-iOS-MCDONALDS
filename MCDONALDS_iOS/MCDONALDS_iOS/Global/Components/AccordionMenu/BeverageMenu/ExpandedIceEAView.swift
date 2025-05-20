//
//  ExpandedIceEAView.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class ExpandedIceEAView: UIView {
    
    private let eaStackView = UIStackView()
    private let nameLabel = UILabel()
    lazy var productEA: Int = 0
    lazy var eaLabel = UILabel()
    lazy var minusButton = UIButton()
    lazy var plusButton = UIButton()
    
    private let allStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setStyle()
        setLayout()
        addSubview(allStackView)
        setActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        nameLabel.do {
            $0.text = "얼음"
            $0.font = .pretendard(.bodyReg12)
        }
        
        minusButton.do {
            $0.setImage(UIImage(named: "icon-minus"), for: .normal)
        }
        
        plusButton.do {
            $0.setImage(UIImage(named: "icon-plus"), for: .normal)
        }
        
        eaLabel.do {
            $0.text = "\(productEA)"
            $0.font = .pretendard(.bodyMed13)
        }
        
        eaStackView.do {
            $0.axis = .horizontal
            $0.spacing = 16
            $0.alignment = .center
            $0.addArrangedSubviews(minusButton, eaLabel, plusButton)
        }
        
        allStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 172
            $0.addArrangedSubviews(nameLabel, eaStackView)
        }
    }
    
    private func setLayout() {
        nameLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
        }
        
        eaStackView.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(20)
        }
        
        allStackView.snp.makeConstraints{
            $0.height.equalTo(42)
        }
    }
    
    private func setActions() {
        plusButton.addTarget(self, action: #selector(increaseEA), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(decreaseEA), for: .touchUpInside)
    }
    
    @objc private func increaseEA() {
        productEA += 1
        updateLabel()
    }
    
    @objc private func decreaseEA() {
        if productEA > 0 {
            productEA -= 1
            updateLabel()
        }
    }
    
    private func updateLabel() {
        eaLabel.text = "\(productEA)"
    }
}
