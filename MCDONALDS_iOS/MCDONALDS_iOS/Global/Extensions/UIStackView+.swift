//
//  UIStackView+.swift
//  MCDONALDS_iOS
//
//  Created by 김승원 on 5/12/25.
//

import UIKit

extension UIStackView {
    /// addArrangedSubview의 복수형 함수입니다
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
