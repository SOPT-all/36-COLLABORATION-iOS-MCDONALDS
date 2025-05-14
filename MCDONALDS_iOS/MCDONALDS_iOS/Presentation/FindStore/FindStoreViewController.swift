//
//  FindStoreViewController.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/15/25.
//

import UIKit

final class FindStoreViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let rootView = FindStoreView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar(type: .findStore)
    }
}
