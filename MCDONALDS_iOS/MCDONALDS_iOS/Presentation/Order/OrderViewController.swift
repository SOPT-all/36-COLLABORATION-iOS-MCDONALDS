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
    
    private let menuServcie = MenuService.shared
    
    var menuId: Int = 0
        
    var burgerName: String = ""

    var singleImg: String = ""

    var singlePrice: String = ""
    
    var setImg: String = ""

    var setPrice: String = ""

    var selectedMenuId: Int = 0
    
    var isComboSelected: Bool = false
    
    var quantity: Int = 1
    
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
                guard let response = try await menuServcie.fetchMenuDetail(menuId: self.menuId) else {
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
    
    init(menuId: Int) {
        self.menuId = menuId
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setAction() {
        rootView.burgerCardView.addGestureRecognizer(burgerTapGesture)
        rootView.comboCardView.addGestureRecognizer(comboTapGesture)
        rootView.plusButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
        rootView.minusButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
        rootView.cartButton.addTarget(self, action: #selector(didTapAddToCartButton), for: .touchUpInside)
        rootView.orderButton.addTarget(self, action: #selector(didTapAddToOrderButton), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    private func updateLabel() {
        rootView.quantityLabel.text = "\(quantity)"
    }
    
    @objc
    private func didTapBurgerView() {
        rootView.burgerCardView.layer.borderColor = UIColor.mainYellow.cgColor
        rootView.burgerCardView.backgroundColor = .mainLightYellow

        rootView.comboCardView.layer.borderColor = UIColor.grayScale200.cgColor
        rootView.comboCardView.backgroundColor = .white
        
        isComboSelected = false
    }
    
    @objc
    private func didTapComboView() {
        rootView.comboCardView.layer.borderColor = UIColor.mainYellow.cgColor
        rootView.comboCardView.backgroundColor = .mainLightYellow

        rootView.burgerCardView.layer.borderColor = UIColor.grayScale200.cgColor
        rootView.burgerCardView.backgroundColor = .white
        
        isComboSelected = true
    }
    
    @objc
    private func increaseQuantity() {
        quantity += 1
        updateLabel()
    }
    
    @objc
    private func decreaseQuantity() {
        if quantity > 1 {
            quantity -= 1
            updateLabel()
        }
    }
    
    @objc
    private func didTapAddToCartButton() {
        let request = CartRequestDTO(
            isSet: isComboSelected,
            menuId: self.menuId,
            amount: quantity
        )

        Task {
            do {
                _ = try await CartService.service.addToCart(with: request)
                navigationController?.popViewController(animated: true)
            } catch {
                print("에러 발생: \(error)")
            }
        }
    }
    
    @objc
    private func didTapAddToOrderButton() {
        let orderListViewController = OrderListViewController()
        navigationController?.pushViewController(orderListViewController, animated: true)
    }
}
