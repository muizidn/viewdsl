//
//  ViewDSL.swift
//  ViewDSL
//
//  Created by PRIME on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit

public extension ViewDSL {
    
    /// Base DSL
    ///
    /// - Parameter closure: callback with explicit parameter type. e.g: (stack: UIStackView)
    /// - Returns: UIView instance of closure parameter type
    @discardableResult
    func add<T>(_ closure: (T) -> Void) -> T where T: UIView {
        let view = T()
        put(view)
        closure(view)
        return view
    }
    
    
    /// Base DSL
    ///
    /// - Parameter closure: function to build UIView instance
    /// - Returns: UIView instance of closure return type
    @discardableResult
    func add<T>(_ closure: () -> T) -> T where T: UIView {
        let view = closure()
        put(view)
        return view
    }
    
    
    
    /// Base DSL
    ///
    /// - Parameters:
    ///   - view: view instance being
    ///   - closure: closure to be applied to view
    /// - Returns: instace of view after closure applied
    @discardableResult
    func add<T>(_ view: T, closure: ((T) -> Void)? = nil) -> T where T: UIView {
        put(view)
        defer { closure?(view) }
        return view
    }
}

public extension ViewDSL {
    /// Delegated DSL
    ///
    /// - Parameter closure: function accept parameter of receiver type
    /// - Returns: Object of closure return type
    @discardableResult
    func dsl<O>(delegatedTo closure: (Self) -> O) -> O where Self: ViewDSL {
        return closure(self)
    }
    
    /// Delegated DSL
    ///
    /// - Parameter closure: function accept parameter of receiver type
    func dsl(delegatedTo closure: (Self) -> Void) {
        closure(self)
    }
}

public extension ViewDSL {
    
    /// Delegated DSL
    ///
    /// - Parameters:
    ///   - builder: LayoutBuilderDSL instance
    ///   - closure: Closure applied to builder object
    /// - Returns: Parameter supplied object
    @discardableResult
    func dsl<B>(delegatedTo builder: B, closure: ((B) -> Void)? = nil) -> B where B: LayoutBuilderDSL {
        builder.layout(self)
        closure?(builder)
        return builder
    }
    
    /// Delegated DSL
    ///
    /// - Parameters:
    ///   - withInstanceOf: Type conform InitializableLayoutBuilderDSL
    ///   - closure: Closure applied to builder object
    /// - Returns: Parameter supplied object
    @discardableResult
    func dsl<B>(withInstanceOf: B.Type, closure: ((B) -> Void)? = nil) -> B where B: InitializableLayoutBuilderDSL {
        let builder = B()
        closure?(builder)
        return dsl(delegatedTo: builder)
    }
}
