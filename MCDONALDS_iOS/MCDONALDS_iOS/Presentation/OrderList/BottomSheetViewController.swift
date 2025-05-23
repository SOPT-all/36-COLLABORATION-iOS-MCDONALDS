//
//  BottomSheetViewController.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/23/25.
//

import UIKit

final class BottomSheetViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let rootView = BottomSheetView()
    
    private var burgerName: String
    
    private var burgerImageString: String
    
    // MARK: - Initializer
    
    init(burgerName: String, burgerImageString: String) {
        self.burgerName = burgerName
        self.burgerImageString = burgerImageString
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.burgerMenuView.configure(burgerName: burgerName, singleImg: burgerImageString)
        rootView.titleLabel.text = burgerName
    }
    
    override func setAction() {
        rootView.backButton.addTarget(
            self,
            action: #selector(backButtonDidTap),
            for: .touchUpInside
        )
    }
}

// MARK: - Functions

extension BottomSheetViewController {
    @objc
    private func backButtonDidTap() {
        dismiss(animated: true)
    }
}
