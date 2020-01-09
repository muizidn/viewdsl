//
//  ViewDSL.swift
//  ViewDSL
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

@objc
public protocol View {}

@objc
public protocol ViewDSL: class {
    @objc
    func put(_ view: View)
}
