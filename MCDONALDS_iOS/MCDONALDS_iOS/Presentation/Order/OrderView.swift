//
//  OrderView.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/18/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class OrderView: BaseView {
    
    // MARK: - UI Properties
        
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let burgerNameLabel = UILabel()
    
    let burgerCardView = UIView()
    
    private let justBurgerImageView = UIImageView()
    
    private let justBurgerLabel = UILabel()
    
    private let burgerPriceLabel = UILabel()
    
    let comboCardView = UIView()
    
    private let comboImageView = UIImageView()
    
    private let comboLabel = UILabel()
    
    private let comboPriceLabel = UILabel()
    
    private let sideMenuView = SideMenuView()
    
    let burgerMenuView = BurgerMenuView()
    
    private let beverageMenuView = BeverageMenuView()
    
    private let quantityChangeView = UIView()
    
    let quantityLabel = UILabel()
    
    
    let plusButton = UIButton()
    
    let minusButton = UIButton()
    
    private let infoButton = UIButton()
    
    private let goInfoButton = UIButton()
    
    let cartButton = McdonaldsButton("장바구니 담기", type: .outlinedYellow)
    
    let orderButton = McdonaldsButton("바로 주문하기", type: .outlinedWhite)

    
    // MARK: - UI Settings
    
    override func setUI() {
        addSubviews(scrollView,
                    cartButton,
                    orderButton)
        
        scrollView.addSubviews(contentView)
        
        burgerCardView.addSubviews(justBurgerImageView,
                                   justBurgerLabel,
                                   burgerPriceLabel)
        
        comboCardView.addSubviews(comboImageView,
                                  comboLabel,
                                  comboPriceLabel)
        
        quantityChangeView.addSubviews(minusButton,
                                       quantityLabel,
                                       plusButton)
        
        contentView.addSubviews(burgerNameLabel,
                                burgerCardView,
                                comboCardView,
                                burgerMenuView,
                                sideMenuView,
                                beverageMenuView,
                                infoButton,
                                goInfoButton,
                                quantityChangeView)
    }
    
    override func setStyle() {
        burgerNameLabel.do {
            $0.font = .pretendard(.headBold29)
            $0.text = ""
        }
        
        burgerCardView.do {
            $0.backgroundColor = .clear
            $0.setBorder(1, borderColor: .grayScale200)
            $0.layer.cornerRadius = 8
            $0.isUserInteractionEnabled = true
        }
        
        justBurgerImageView.do {
            $0.image = UIImage(named: "")
            $0.contentMode = .scaleAspectFit
        }
        
        justBurgerLabel.do {
            $0.text = "단품"
            $0.font = .pretendard(.headBold16)
        }
        
        burgerPriceLabel.do {
            $0.text = ""
            $0.font = .pretendard(.bodyReg13)
        }
        
        comboCardView.do {
            $0.backgroundColor = .clear
            $0.setBorder(1, borderColor: .grayScale200)
            $0.layer.cornerRadius = 8
            $0.isUserInteractionEnabled = true
        }
        
        comboImageView.do {
            $0.image = UIImage(named: "")
            $0.contentMode = .scaleAspectFit
        }
        
        comboLabel.do {
            $0.text = "세트"
            $0.font = .pretendard(.headBold16)
        }
        
        comboPriceLabel.do {
            $0.text = ""
            $0.font = .pretendard(.bodyReg13)
        }
        
        infoButton.do {
            $0.setTitle("원산지, 영양성분 및 알레르기 정보", for: .normal)
            $0.setTitleColor(.grayScale500, for: .normal)
            $0.titleLabel?.font = .pretendard(.bodyReg14)
        }
        
        goInfoButton.do {
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.tintColor = .grayScale500
        }
        
        quantityChangeView.do {
            $0.backgroundColor = .clear
            $0.setBorder(1, borderColor: .grayScale200)
            $0.layer.cornerRadius = 8
        }
        
        minusButton.do {
            $0.setImage(UIImage(named: "icon-minus"), for: .normal)
        }
        
        quantityLabel.do {
            $0.text = "1"
            $0.font = .pretendard(.captionMed19)
        }
        
        plusButton.do {
            $0.setImage(UIImage(named: "icon-plus"), for: .normal)
        }
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        burgerNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(29)
            $0.leading.equalToSuperview().offset(28)
        }
        
        burgerCardView.snp.makeConstraints{
            $0.top.equalTo(burgerNameLabel.snp.bottom).offset(20)
            $0.leading.equalTo(burgerNameLabel.snp.leading)
            $0.height.equalTo(204)
            $0.width.equalTo(150)
        }
        
        justBurgerImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(104)
        }
        
        justBurgerLabel.snp.makeConstraints {
            $0.top.equalTo(justBurgerImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        burgerPriceLabel.snp.makeConstraints{
            $0.top.equalTo(justBurgerLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        comboCardView.snp.makeConstraints{
            $0.top.equalTo(burgerCardView)
            $0.trailing.equalToSuperview().offset(-28)
            $0.height.equalTo(204)
            $0.width.equalTo(150)
        }
        
        comboImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(104)
        }
        
        comboLabel.snp.makeConstraints {
            $0.top.equalTo(comboImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        comboPriceLabel.snp.makeConstraints{
            $0.top.equalTo(comboLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        burgerMenuView.snp.makeConstraints{
            $0.top.equalTo(burgerCardView.snp.bottom).offset(10)
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
        
        infoButton.snp.makeConstraints{
            $0.top.equalTo(quantityChangeView.snp.bottom).offset(33.5)
            $0.leading.equalToSuperview().offset(28)
            $0.bottom.equalToSuperview().inset(40)
        }
        
        goInfoButton.snp.makeConstraints{
            $0.centerY.equalTo(infoButton.snp.centerY)
            $0.leading.equalTo(infoButton.snp.trailing).offset(7)
            $0.height.equalTo(10)
            $0.width.equalTo(5)

        }
        
        quantityChangeView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(145)
            $0.top.equalTo(beverageMenuView.snp.bottom).offset(26)
            $0.centerX.equalToSuperview()
        }
        
        quantityLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        minusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
        }
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-14)
        }
        
        orderButton.snp.makeConstraints{
            $0.height.equalTo(60)
            $0.width.equalTo(187.5)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        cartButton.snp.makeConstraints{
            $0.height.equalTo(60)
            $0.width.equalTo(187.5)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func configure(burgerName: String, singleImg: String, singlePrice: String, setImg: String, setPrice: String) {
        burgerNameLabel.text = burgerName
        burgerPriceLabel.text = singlePrice
        comboPriceLabel.text = setPrice
        
        if let imageURL = URL(string: singleImg) {
            justBurgerImageView.kf.setImage(with: imageURL)
        }
        
        if let imageURL = URL(string: setImg) {
            comboImageView.kf.setImage(with: imageURL)
        }
    }
}

