//
//  ViewDSL.swift
//  ViewDSL
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

@objc
public protocol ViewDSL: class {
    @objc
    func put(_ view: UIView)
}

extension UIView: ViewDSL {}

extension UIView {
    @objc
    open func put(_ view: UIView) {
        addSubview(view)
    }
}

extension UIStackView {
    @objc
    open override func put(_ view: UIView) {
        addArrangedSubview(view)
    }
}
