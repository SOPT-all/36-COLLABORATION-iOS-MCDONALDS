//
//  BaseViewController.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/12/25.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAction()
        setDelegate()
    }
    
    /// 네비게이션 바 등 추가적으로 UI와 관련한 작업
    func setView() {}
    
    /// RootView로부터 액션 설정 (addTarget)
    func setAction() {}
    
    /// RootView 또는 ViewController 자체로부터 Delegate, DateSource 등 설정
    func setDelegate() {}
}

// MARK: - Custom NavigationBar

extension BaseViewController {
    
    /// Mcdonalds 커스텀 네비게이션 바 세팅 함수입니다.
    /// - Parameter type: 네비게이션 바 타입 (McdonalsNavigationBarType)
    func setNavigationBar(type: McdonalsNavigationBarType) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = .staticWhite
        appearance.shadowColor = nil
        
        title = type.title
        let titleFont = UIFont.pretendard(.headBold16)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: titleFont,
            .foregroundColor: UIColor.staticBlack
        ]
        appearance.titleTextAttributes = titleAttributes
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        let leftItem = UIBarButtonItem(
            image: type.leftBarButtonItemImage,
            style: .done,
            target: self,
            action: #selector(leftBarButtonItemDidTap)
        )
        leftItem.tintColor = .grayScale800
        navigationItem.leftBarButtonItem = leftItem
        
        if let rightItem = type.rightBarButtonItem {
            navigationItem.rightBarButtonItem = rightItem
        }
    }
    
    @objc
    private func leftBarButtonItemDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    enum McdonalsNavigationBarType {
        case findStore
        case menuList
        case order
        case orderList
        
        var title: String {
            switch self {
            case .findStore:
                return "매장찾기"
            case .menuList:
                return "버거 & 세트"
            case .order:
                return "주문하기"
            case .orderList:
                return "주문내역"
            }
        }
        
        var leftBarButtonItemImage: UIImage {
            switch self {
            case .findStore, .orderList:
                return .iconClose
            case .menuList, .order:
                return .iconBackarrow
            }
        }
        
        var rightBarButtonItem: UIBarButtonItem? {
            switch self {
            case .findStore:
                let item = UIBarButtonItem(
                    image: .iconSearch,
                    style: .plain,
                    target: nil,
                    action: nil
                )
                item.tintColor = .grayScale800
                return item
            default:
                return nil
            }
        }
    }
}
