//
//  Abstraction.swift
//  ViewDSL
//
//  Created by PondokIOS on 26/07/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit
public typealias View = NSView
public typealias StackView = NSStackView
#else
import UIKit
public typealias View = UIView
public typealias StackView = UIStackView
#endif
