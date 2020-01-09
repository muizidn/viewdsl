//
//  UIKit+Extensions.swift
//  ViewDSL
//
//  Created by Muis on 09/01/20.
//  Copyright © 2020 PondokIT. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension UIView: ViewDSL {}
extension UIView: View {}

extension UIView {
    @objc
    open func put(_ view: View) {
        addSubview(view as! UIView)
    }
}

extension UIStackView {
    @objc
    open override func put(_ view: View) {
        addArrangedSubview(view as! UIView)
    }
}
#endif
