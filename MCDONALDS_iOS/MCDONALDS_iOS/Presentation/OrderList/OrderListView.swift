//
//  OrderListView.swift
//  MCDONALDS_iOS
//
//  Created by 김현우 on 5/14/25.
//

import UIKit
import SnapKit
import Then

final class OrderListView: BaseView {
    
    // MARK: - UI Properties
    
    // Header
    private let storeIconImageView = UIImageView()
    let storeNameLabel = UILabel()
    let changeStoreButton = UIButton(type: .system)
    private let headerSeparator = UIView()
    
    // Menu Cell
    private let menuContainer = UIView()
    let menuImageView = UIImageView()
    let menuTitleLabel = UILabel()
    let menuDetailLabel = UILabel()
    let menuPriceLabel = UILabel()
    
    // Quantity & Actions
    private let quantityContainer = UIView()
    let minusButton = UIButton(type: .custom)
    let quantityLabel = UILabel()
    let plusButton = UIButton(type: .custom)
    let editButton = UIButton(type: .custom)
    let deleteButton = UIButton(type: .custom)
    
    // + 메뉴 추가
    let addMenuButton = UIButton(type: .custom)
    
    // Footer (주문 금액)
    private let footerSeparator = UIView()
    private let footerContainer = UIView()
    private let orderAmountStaticLabel = UILabel()
    let totalPriceLabel = UILabel()
    
    // MARK: - McdonaldsButton
    
    /// 최하단 노란 버튼
    let selectLocationButton = McdonaldsButton("제품 수령 장소 선택", type: .plainYellow)
    
    // MARK: - State
    
    private var quantity: Int = 1
    
    // MARK: - UI Setting
    
    override func setStyle() {
        backgroundColor = .staticWhite
        
        // Header
        storeIconImageView.do {
            $0.image = UIImage(named: "icon-mclocation")
            $0.contentMode = .scaleAspectFit
        }
        storeNameLabel.do {
            $0.text = "양평SK DT"
            $0.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.textColor = .black
        }
        changeStoreButton.do {
            var config = UIButton.Configuration.bordered()
            config.title = "매장 변경"
            config.baseForegroundColor = .pointBlue
            config.background.backgroundColor = .white
            config.background.strokeColor = .pointBlue
            config.background.strokeWidth = 0.5
            config.background.cornerRadius = 8
            config.contentInsets = .init(top: 9, leading: 10, bottom: 9, trailing: 10)
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { inc in
                var out = inc
                out.font = UIFont(name: "Pretendard-Regular", size: 11)
                return out
            }
            $0.configuration = config
            $0.tintColor = .pointBlue
        }
        headerSeparator.do {
            $0.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        }
        
        // Menu Cell
        menuContainer.do { $0.backgroundColor = .white }
        menuImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(named: "menu-image-placeholder")
        }
        menuTitleLabel.do {
            $0.text = "더블 1955® 버거 - 세트"
            $0.font = UIFont(name: "Pretendard-Bold", size: 16)
            $0.textColor = .black
        }
        menuDetailLabel.do {
            let detailText = """
            더블 1955® 버거
            후렌치 후라이 - 미디엄
            스프라이트 - 미디엄
            선택 안함
            """
            let paragraphStyle = NSMutableParagraphStyle().then { $0.lineSpacing = 4 }
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Pretendard-Regular", size: 12)!,
                .foregroundColor: UIColor.gray,
                .paragraphStyle: paragraphStyle
            ]
            $0.attributedText = NSAttributedString(string: detailText, attributes: attrs)
            $0.numberOfLines = 0
        }
        menuPriceLabel.do {
            $0.text = "₩11,500"
            $0.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.textColor = .black
        }
        
        // Quantity & Actions
        quantityContainer.do {
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
            $0.layer.cornerRadius = 8
        }
        minusButton.do {
            $0.setImage(UIImage(named: "icon-minus"), for: .normal)
            $0.tintColor = .pointBlue
            $0.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        }
        quantityLabel.do {
            $0.text = "\(quantity)"
            $0.font = UIFont(name: "Pretendard-Bold", size: 14)
            $0.textAlignment = .center
        }
        plusButton.do {
            $0.setImage(UIImage(named: "icon-plus"), for: .normal)
            $0.tintColor = .pointBlue
            $0.addTarget(self, action: #selector(increment), for: .touchUpInside)
        }
        
        // Edit/Delete Buttons
        editButton.do {
            $0.setImage(UIImage(named: "button-menu edit"), for: .normal)
            $0.tintColor = .pointBlue
        }
        deleteButton.do {
            $0.setImage(UIImage(named: "button-delete"), for: .normal)
            $0.tintColor = .pointBlue
        }
        
        // + 메뉴 추가
        addMenuButton.do {
            var config = UIButton.Configuration.bordered()
            config.title = "+ 메뉴 추가"
            config.baseForegroundColor = .staticBlack
            config.background.backgroundColor = .white
            config.background.strokeColor = .grayScale400
            config.background.strokeWidth = 1
            config.background.cornerRadius = 20
            config.contentInsets = .init(top: 10, leading: 20, bottom: 10, trailing: 20)
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { inc in
                var out = inc
                out.font = UIFont(name: "Pretendard-Regular", size: 14)
                return out
            }
            $0.configuration = config
            $0.tintColor = .pointBlue
        }
        
        // Footer (주문 금액)
        footerSeparator.do {
            $0.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        }
        footerContainer.do {
            $0.backgroundColor = .white
        }
        orderAmountStaticLabel.do {
            $0.text = "주문 금액"
            $0.font = UIFont(name: "Pretendard-Bold", size: 16)
            $0.textColor = .black
        }
        totalPriceLabel.do {
            $0.text = "₩11,500"
            $0.font = UIFont(name: "Pretendard-Bold", size: 16)
            $0.textColor = .black
        }
    }
    
    // MARK: - UI Hierarchy
    
    override func setUI() {
        // Header
        addSubviews(storeIconImageView,
                    storeNameLabel,
                    changeStoreButton,
                    headerSeparator)
        
        // Menu Cell
        addSubview(menuContainer)
        menuContainer.addSubviews(menuTitleLabel,
                                  menuDetailLabel,
                                  menuImageView,
                                  menuPriceLabel,
                                  quantityContainer,
                                  minusButton,
                                  quantityLabel,
                                  plusButton,
                                  editButton,
                                  deleteButton)
        quantityContainer.addSubviews(minusButton,
                                      quantityLabel,
                                      plusButton)
        
        // + 메뉴 추가
        addSubview(addMenuButton)
        
        // Footer
        addSubview(footerContainer)
        footerContainer.addSubview(footerSeparator)
        footerContainer.addSubviews(orderAmountStaticLabel,
                                    totalPriceLabel)
        
        // Select Location Button
        addSubview(selectLocationButton)
    }
    
    // MARK: - Layout
    
    override func setLayout() {
        // Header
        storeIconImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(13)
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(30)
        }
        storeNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(storeIconImageView)
            $0.leading.equalTo(storeIconImageView.snp.trailing).offset(8)
        }
        changeStoreButton.snp.makeConstraints {
            $0.centerY.equalTo(storeIconImageView)
            $0.trailing.equalToSuperview().inset(16)
        }
        headerSeparator.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(56)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        // Menu Container
        menuContainer.snp.makeConstraints {
            $0.top.equalTo(headerSeparator.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        menuImageView.snp.makeConstraints {
            $0.top.equalTo(menuContainer).offset(16)
            $0.trailing.equalTo(menuContainer).inset(16)
            $0.size.equalTo(80)
        }
        menuTitleLabel.snp.makeConstraints {
            $0.top.equalTo(menuContainer).offset(16)
            $0.leading.equalTo(menuContainer).offset(16)
            $0.trailing.equalTo(menuImageView.snp.leading).offset(-8)
        }
        menuDetailLabel.snp.makeConstraints {
            $0.top.equalTo(menuTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(menuTitleLabel)
        }
        menuPriceLabel.snp.makeConstraints {
            $0.top.equalTo(menuDetailLabel.snp.bottom).offset(24)
            $0.leading.equalTo(menuTitleLabel)
        }
        
        // Quantity Container
        quantityContainer.snp.makeConstraints {
            $0.top.equalTo(menuPriceLabel.snp.bottom).offset(24)
            $0.leading.equalTo(menuTitleLabel)
            $0.width.equalTo(88)
            $0.height.equalTo(32)
            $0.trailing.equalTo(plusButton.snp.trailing).offset(8)
        }
        // Quantity & Actions
        minusButton.snp.makeConstraints {
            $0.top.equalTo(menuPriceLabel.snp.bottom).offset(26)
            $0.leading.equalTo(menuTitleLabel)
            $0.size.equalTo(28)
        }
        quantityLabel.snp.makeConstraints {
            $0.centerY.equalTo(minusButton)
            $0.leading.equalTo(minusButton.snp.trailing).offset(1)
            $0.width.equalTo(28)
        }
        plusButton.snp.makeConstraints {
            $0.centerY.equalTo(minusButton)
            $0.leading.equalTo(quantityLabel.snp.trailing).offset(1)
            $0.size.equalTo(28)
        }
        
        // Edit/Delete
        deleteButton.snp.makeConstraints {
            $0.centerY.equalTo(minusButton)
            $0.trailing.equalTo(menuContainer).inset(16)
            $0.size.equalTo(32)
        }
        editButton.snp.makeConstraints {
            $0.centerY.equalTo(minusButton)
            $0.trailing.equalTo(deleteButton.snp.leading).offset(-16)
            $0.size.equalTo(32)
        }
        
        // Separator below menu
        let menuSeparator = UIView().then { $0.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3) }
        menuContainer.addSubview(menuSeparator)
        menuSeparator.snp.makeConstraints {
            $0.top.equalTo(minusButton.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
        
        // + 메뉴 추가
        addMenuButton.snp.makeConstraints {
            $0.top.equalTo(menuContainer.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        // Footer (주문 금액)
        footerContainer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(56)
        }
        footerSeparator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        orderAmountStaticLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        totalPriceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        
        // Select Location Button
        selectLocationButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(56)
        }
    }
    
    // MARK: - Actions
    
    @objc private func decrement() {
        guard quantity > 1 else { return }
        quantity -= 1
        quantityLabel.text = "\(quantity)"
    }
    
    @objc private func increment() {
        quantity += 1
        quantityLabel.text = "\(quantity)"
    }
}
