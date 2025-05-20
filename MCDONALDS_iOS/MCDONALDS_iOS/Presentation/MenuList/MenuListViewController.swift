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
    
    private var filterButtons: [UIButton] = []
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFilterButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar(type: .menuList)
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
}

// MARK: - Functions

extension MenuListViewController {
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
