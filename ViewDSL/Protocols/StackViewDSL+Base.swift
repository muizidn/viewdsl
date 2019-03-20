//
//  StackViewDSL+Base.swift
//  ViewDSL
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

public extension BaseDSL where Self: StackViewDSL {
    @discardableResult
    func stackAdd<T>(_ completion: (T) -> Void) -> T where T: UIView {
        let view = T()
        addArrangedSubview(view)
        completion(view)
        return view
    }
    
    @discardableResult
    func stackAdd<T>(_ completion: () -> T) -> T where T: UIView {
        let view = completion()
        addArrangedSubview(view)
        return view
    }
}
