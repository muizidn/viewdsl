//
//  StackViewDSL.swift
//  ViewDSL
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

public protocol StackViewDSL: ViewDSL {
    func addArrangedSubview(_ view: UIView)
}
