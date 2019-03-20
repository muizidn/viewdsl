//
//  ClosureInit.swift
//  ViewDSL
//
//  Created by PRIME on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import Foundation

public protocol ClosureInit: class {
    init()
}

extension ClosureInit {
    init(_ completion: (Self) -> Void) {
        self.init()
        completion(self)
    }
}

extension NSObject: ClosureInit {}
