//
//  ViewDSL.swift
//  ViewDSL
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import Foundation

@objc
public protocol ViewDSL: class {
    @objc
    func put(_ view: View)
}

extension View: ViewDSL {}

extension View {
    @objc
    open func put(_ view: View) {
        addSubview(view)
    }
}

extension StackView {
    @objc
    open override func put(_ view: View) {
        addArrangedSubview(view)
    }
}
