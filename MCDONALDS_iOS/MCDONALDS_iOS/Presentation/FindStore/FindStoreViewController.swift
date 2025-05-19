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
        
        setNavigationBar(type: .findStore)
    }
    
    override func setAction() {
        rootView.mcdriveButton.addTarget(
            self,
            action: #selector(filterButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.twentyFourHourButton.addTarget(
            self,
            action: #selector(filterButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.parkingLotButton.addTarget(
            self,
            action: #selector(filterButtonDidTap),
            for: .touchUpInside
        )
        
        rootView.locationPinButton
            .addTarget(
                self,
                action: #selector(locationPinButtonDidTap),
                for: .touchUpInside
            )
    }
}

// MARK: - Functions

extension FindStoreViewController {
    private func setFilterButtons() {
        [
            rootView.mcdriveButton,
            rootView.twentyFourHourButton,
            rootView.parkingLotButton
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
    
    @objc
    private func locationPinButtonDidTap() {
        print(#function)
    }
}
