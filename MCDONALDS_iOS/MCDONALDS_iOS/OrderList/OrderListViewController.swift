import UIKit
import SnapKit
import Then

final class OrderListViewController: BaseViewController {
    
    private let rootView = OrderListView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRegister()
    }
    
    override func setAction() {
        rootView.changeStoreButton.addTarget(self, action: #selector(didTapChangeStore), for: .touchUpInside)
        rootView.minusButton.addTarget(self, action: #selector(didTapMinus), for: .touchUpInside)
        rootView.plusButton.addTarget(self, action: #selector(didTapPlus), for: .touchUpInside)
        rootView.editButton.addTarget(self, action: #selector(didTapEdit), for: .touchUpInside)
        rootView.deleteButton.addTarget(self, action: #selector(didTapDelete), for: .touchUpInside)
        rootView.addMenuButton.addTarget(self, action: #selector(didTapAddMenu), for: .touchUpInside)
    }
}

// MARK: - Functions

extension OrderListViewController {
    private func setRegister() {
        // Cell 등록 등
    }
    
    @objc private func didTapChangeStore() {
        // 매장 변경
    }
    
    @objc private func didTapMinus() {
        // 수량 -1
    }
    
    @objc private func didTapPlus() {
        // 수량 +1
    }
    
    @objc private func didTapEdit() {
        // 메뉴 옵션 수정
    }
    
    @objc private func didTapDelete() {
        // 메뉴 삭제
    }
    
    @objc private func didTapAddMenu() {
        // + 메뉴 추가
    }
}


