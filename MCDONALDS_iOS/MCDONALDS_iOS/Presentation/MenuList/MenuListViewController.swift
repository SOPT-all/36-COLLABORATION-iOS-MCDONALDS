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
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar(type: .menuList)
    }
}
