//
//  OrderListViewController.swift
//  MCDONALDS_iOS
//
//  Created by 김현우 on 5/14/25.
//

import UIKit
import SnapKit
import Then

final class OrderListViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let rootView = OrderListView()
    private let cartService = CartService.service
    private var orderService = OrderService.shared
    
    private var price: Int = 0
    
    private var burgerName: String = ""
    private var burgerImageString: String = ""
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(type: .orderList)
        
        Task {
            do {
                guard let response = try await cartService.fetchCart() else {
                    return
                }
                rootView.menuTitleLabel.text = response.data.cartItems[response.data.cartItems.count - 1].menuName
                if let imageURL = URL(string: response.data.cartItems[response.data.cartItems.count - 1].imageUrl) {
                    rootView.menuImageView.kf.setImage(with: imageURL)
                    rootView.recentOrderImageView.kf.setImage(with: imageURL)
                }
                rootView.menuDetailLabel.text = """
\(response.data.cartItems[response.data.cartItems.count - 1].menuName)
후렌치 후라이 - 미디엄
스프라이트 - 미디엄
선택 안함
"""
                rootView.menuPriceLabel.text = "₩\(response.data.cartItems[response.data.cartItems.count - 1].price)"
                rootView.totalPriceLabel.text = "₩\(response.data.cartItems[response.data.cartItems.count - 1].price * response.data.cartItems[response.data.cartItems.count - 1].amount)"
                rootView.recentOrderPriceLabel.text = "₩\(response.data.cartItems[response.data.cartItems.count - 1].price) ~"
                rootView.recentOrderNameLabel.text = response.data.cartItems[response.data.cartItems.count - 1].menuName
                price = response.data.cartItems[response.data.cartItems.count - 1].price
                rootView.quantity = response.data.cartItems[response.data.cartItems.count - 1].amount
                rootView.quantityLabel.text = "\(response.data.cartItems[response.data.cartItems.count - 1].amount)"
                burgerName = response.data.cartItems[response.data.cartItems.count - 1].menuName
                burgerImageString = response.data.cartItems[response.data.cartItems.count - 1].imageUrl
                
            }
        }
    }
    
    override func setAction() {
        rootView.minusButton.addTarget(self, action: #selector(didTapMinus),   for: .touchUpInside)
        rootView.plusButton .addTarget(self, action: #selector(didTapPlus),    for: .touchUpInside)
        rootView.editButton .addTarget(self, action: #selector(didTapEdit),    for: .touchUpInside)
        rootView.deleteButton.addTarget(self, action: #selector(didTapDelete),  for: .touchUpInside)
        rootView.addMenuButton.addTarget(self, action: #selector(didTapAddMenu),for: .touchUpInside)
        rootView.selectLocationButton.addTarget(self, action:#selector(didTapSelectLocation), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    private func setRegister() {
        // UICollectionView 셀 등록 등
    }
    
    // MARK: - Actions (@objc)
    
    @objc private func didTapMinus() {
        rootView.totalPriceLabel.text = "₩\(rootView.quantity * price)"
    }
    @objc private func didTapPlus() {
        rootView.totalPriceLabel.text = "₩\(rootView.quantity * price)"
    }
    @objc private func didTapEdit() {
        // 옵션 변경 Bottom Sheet
        let editVC = BottomSheetViewController(
            burgerName: burgerName,
            burgerImageString: burgerImageString
        )
        editVC.modalPresentationStyle = .pageSheet
        if let sheet = editVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 16
        }
        present(editVC, animated: true)
    }
    @objc private func didTapDelete() {
        // 메뉴 삭제 처리
    }
    @objc private func didTapAddMenu() {
        guard let viewControllers = navigationController?.viewControllers else {
            return
        }
        
        for viewController in viewControllers {
            if viewController is MenuListViewController {
                navigationController?.popToViewController(viewController, animated: true)
            }
        }
    }
    @objc private func didTapSelectLocation() {
        Task {
            do {
                guard let _ = try await orderService.order() else {
                    return
                }
            }
        }
        
        rootView.emptyCartContainerView.isHidden = false
        rootView.footerSeparator.isHidden = true
        rootView.footerContainer.isHidden = true
        rootView.recentOrderContainerView.isHidden = false
        rootView.recentOrderTitleLabel.isHidden = false
    }
}
