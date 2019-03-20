//
//  DelegatedDSL.swift
//  ViewDSL
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

public protocol DelegatedDSL {}

public extension DelegatedDSL where Self: ViewDSL {
    @discardableResult
    func dsl<O>(delegatedTo function: (Self) -> O) -> O where Self: ViewDSL {
        return function(self)
    }
    
    func dsl(delegatedTo function: (Self) -> Void) {
        function(self)
    }
}


extension DelegatedDSL {
    @discardableResult
    func dsl<B>(delegatedTo builder: B) -> B where B: LayoutBuilderDSL, B.T == Self {
        builder.layout(self)
        return builder
    }
    
    @discardableResult
    func dsl<B>(withInstanceOf: B.Type) -> B where B: InitializableLayoutBuilderDSL, B.T == Self {
        let builder = B()
        return dsl(delegatedTo: builder)
    }
}
