//
//  OrderViewController.swift
//  MCDONALDS_iOS
//
//  Created by 이상엽 on 5/18/25.
//

import UIKit

final class OrderViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let rootView = OrderView()
    
    private let menuDetailServcie = MenuDetailService.shared
        
    var burgerName: String = ""

    var singleImg: String = ""

    var singlePrice: String = ""
    
    var setImg: String = ""

    var setPrice: String = ""

    
    private lazy var burgerTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBurgerView))

    private lazy var comboTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapComboView))
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar(type: .order)
        
        Task {
            do {
                guard let response = try await menuDetailServcie.fetchMenuDetail(menuId: 2) else {
                    return
                }
                dump(response.data)
                let data = response.data
                rootView.configure(
                    burgerName: data.menuName,
                    singleImg: data.singleImg,
                    singlePrice: data.singlePrice,
                    setImg: data.setImg,
                    setPrice: data.setPrice
                )
                rootView.burgerMenuView.configure(
                    burgerName: data.menuName,
                    singleImg: data.singleImg,
                )
            } catch {
                dump(error)
            }
        }
    }
    
    override func setAction() {
        rootView.burgerCardView.addGestureRecognizer(burgerTapGesture)
        rootView.comboCardView.addGestureRecognizer(comboTapGesture)
        rootView.plusButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
        rootView.minusButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    @objc
    private func didTapBurgerView() {
        rootView.burgerCardView.layer.borderColor = UIColor.mainYellow.cgColor
        rootView.burgerCardView.backgroundColor = .mainLightYellow

        rootView.comboCardView.layer.borderColor = UIColor.grayScale200.cgColor
        rootView.comboCardView.backgroundColor = .white
    }
    
    @objc
    private func didTapComboView() {
        rootView.comboCardView.layer.borderColor = UIColor.mainYellow.cgColor
        rootView.comboCardView.backgroundColor = .mainLightYellow

        rootView.burgerCardView.layer.borderColor = UIColor.grayScale200.cgColor
        rootView.burgerCardView.backgroundColor = .white
    }
    
    @objc
    private func increaseQuantity() {
        rootView.quantity += 1
        updateLabel()
    }
    
    @objc
    private func decreaseQuantity() {
        if rootView.quantity > 0 {
            rootView.quantity -= 1
            updateLabel()
        }
    }
    
    private func updateLabel() {
        rootView.quantityLabel.text = "\(rootView.quantity)"
    }
}
