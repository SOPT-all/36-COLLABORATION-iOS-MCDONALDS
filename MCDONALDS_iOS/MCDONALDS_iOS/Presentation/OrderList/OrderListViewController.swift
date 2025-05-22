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
    private let menuService = MenuService.shared
    
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
        // 수량 감소
    }
    @objc private func didTapPlus() {
        // 수량 증가
    }
    @objc private func didTapEdit() {
        // 옵션 변경 Bottom Sheet
        let editVC = OrderViewController(menuId: 1)
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
        // + 메뉴 추가
    }
    @objc private func didTapSelectLocation() {
        // 수령 장소 선택
    }
}
