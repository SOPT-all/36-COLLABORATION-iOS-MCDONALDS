//
//  MenuListViewController.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/20/25.
//

import UIKit

final class MenuListViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let rootView = MenuListView()
    
    private let menuServcie = MenuService.shared
    
    private var filterButtons: [UIButton] = []
    
    private var menuList: [Menu] = []
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFilterButtons()
        setRegister()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar(type: .menuList)
        
        Task {
            do {
                guard let response = try await menuServcie.fetchMenuList() else {
                    return
                }
                
                menuList = response.data.menuList
                rootView.menuListCollectionView.reloadData()
            } catch {
                dump(error)
            }
        }
    }
    
    override func setAction() {
        rootView.newMenuButton.addTarget(
            self,
            action: #selector(filterButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.recommendButton.addTarget(
            self,
            action: #selector(filterButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.crispyButton.addTarget(
            self,
            action: #selector(filterButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.bulgogiButton.addTarget(
            self,
            action: #selector(filterButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.cheeseButton.addTarget(
            self,
            action: #selector(filterButtonDidTap),
            for: .touchUpInside
        )
    }
    
    override func setDelegate() {
        rootView.menuListCollectionView.delegate = self
        rootView.menuListCollectionView.dataSource = self
    }
}

// MARK: - Functions

extension MenuListViewController {
    private func setRegister() {
        rootView.menuListCollectionView.register(
            MenuListCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuListCollectionViewCell.reuseIdentifier
        )
    }
    
    private func setFilterButtons() {
        [
            rootView.newMenuButton,
            rootView.recommendButton,
            rootView.crispyButton,
            rootView.bulgogiButton,
            rootView.cheeseButton
        ].forEach { button in
            filterButtons.append(button)
        }
    }
    
    @objc
    private func filterButtonDidTap(_ sender: UIButton) {
        for button in filterButtons {
            let isSelected = (button == sender)
            button.isSelected = isSelected
        }
    }
}

// MARK: - UICollectionViewDataSource

extension MenuListViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return menuList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = rootView.menuListCollectionView.dequeueReusableCell(
            withReuseIdentifier: MenuListCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? MenuListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(menuList[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 375, height: 94)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        /*
         Todo: 주문하기 뷰컨으로 버거 id 전달
         */
        let selectedMenu = menuList[indexPath.row]
        let orderViewController = OrderViewController(menuId: selectedMenu.menuId)
        navigationController?.pushViewController(orderViewController, animated: true)
    }
}
