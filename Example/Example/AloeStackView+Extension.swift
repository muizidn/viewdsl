//
//  AloeStackView.swift
//  Example
//
//  Created by PRIME on 21/03/19.
//

import UIKit
import ViewDSL
import AloeStackView

extension AloeStackView {
    @objc
    public override func put(_ view: View) {
        addRow(view as! UIView, animated: true)
    }
}
