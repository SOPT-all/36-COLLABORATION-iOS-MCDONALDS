//
//  BurgerMenuView.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/18/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class BurgerMenuView: UIView {
    
    private var isSideExpanded = true
    private var isEAExpanded = true
    private var expandedSideMenuHeight: Constraint?
    private var expandedEAHeight: Constraint?
    
    private let containerView = UIView()
    private let stackView = UIStackView()
    private let sideMenuImageView = UIImageView()
    private let sideMenuLabel = UILabel()
    
    private let separatorView1 = UIView()
    
    private let changeIngredientsLabel = UILabel()
    private lazy var changeIngredientsButton = UIButton()
    
    private let expandedtoppingEAView = ExpandedToppingEAView()
    
    private let hiddenSeparatorView2 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(containerView)
        containerView.addSubviews(stackView,
                                  separatorView1,
                                  changeIngredientsLabel,
                                  changeIngredientsButton,
                                  expandedtoppingEAView,
                                  hiddenSeparatorView2
        )
        stackView.addArrangedSubview(sideMenuImageView)
        stackView.addArrangedSubview(sideMenuLabel)
        expandedtoppingEAView.isHidden = true
        hiddenSeparatorView2.isHidden = true
    }
    
    private func setStyle() {
        
        containerView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 12
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.grayScale200.cgColor
            $0.clipsToBounds = true
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 14
        }
        
        sideMenuImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(named: "")
            $0.clipsToBounds = true
        }
        
        sideMenuLabel.do {
            $0.font = .pretendard(.bodyBold14)
            $0.text = ""
        }
        
        separatorView1.do {
            $0.backgroundColor = .grayScale200
        }
        
        changeIngredientsLabel.do {
            $0.font = .pretendard(.bodyReg14)
            $0.text = "재료 변경"
        }
        
        changeIngredientsButton.do {
            $0.setImage(UIImage(named: "icon-downarrow"), for: .normal)
            $0.addTarget(self, action: #selector(expandEASection), for: .touchUpInside)
            
        }
        
        hiddenSeparatorView2.do {
            $0.backgroundColor = .grayScale200
        }
        
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalToSuperview()
            $0.height.equalTo(88)
        }
        
        sideMenuImageView.snp.makeConstraints{
            $0.width.height.equalTo(60)
        }
        
        separatorView1.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.top.equalTo(sideMenuImageView.snp.bottom).offset(8)
            $0.horizontalEdges.equalTo(containerView.snp.horizontalEdges)
        }
        
        changeIngredientsLabel.snp.makeConstraints{
            $0.leading.equalTo(containerView.snp.leading).offset(24)
            $0.top.equalTo(separatorView1.snp.bottom).offset(10)
        }
        
        changeIngredientsButton.snp.makeConstraints{
            $0.trailing.equalTo(containerView.snp.trailing).inset(16)
            $0.centerY.equalTo(changeIngredientsLabel.snp.centerY)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        hiddenSeparatorView2.snp.makeConstraints{
            $0.height.equalTo(1)
            $0.top.equalTo(changeIngredientsLabel.snp.bottom).offset(9)
            $0.horizontalEdges.equalTo(containerView.snp.horizontalEdges)
        }
        
        expandedtoppingEAView.snp.makeConstraints{
            $0.top.equalTo(hiddenSeparatorView2.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            self.expandedEAHeight = $0.height.equalTo(0).constraint
            $0.bottom.equalToSuperview()
        }
        
    }
    
    func configure(burgerName: String, singleImg: String) {
        sideMenuLabel.text = burgerName

        print(sideMenuLabel)
        if let imageURL = URL(string: singleImg) {
            sideMenuImageView.kf.setImage(with: imageURL)
        }
    }
    
    @objc
    private func expandEASection() {
        isEAExpanded.toggle()
        
        expandedtoppingEAView.isHidden = !isEAExpanded
        hiddenSeparatorView2.isHidden = !isEAExpanded
        
        expandedEAHeight?.update(offset: isEAExpanded ? 42 * 6 : 0)
        
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
}
