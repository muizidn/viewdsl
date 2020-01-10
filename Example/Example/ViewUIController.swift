//
//  ViewUIController.swift
//  Example
//
//  Created by Muis on 09/01/20.
//

import UIKit
import ViewDSL

final class ViewUIController: UIViewController {
    var body: SomeView {
        XHStack {
            XHStack {
//                XHStack()
//                XHStack()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(body)
        view = body.view
    }
}

protocol UIKitContainer {
    associatedtype UIKitView: UIView
    var _view: UIKitView { get }
    static func create(_ view: UIKitView, subViews: [SomeView]) -> Self
}

@_functionBuilder
struct ViewBuilder<T: SomeView & UIKitContainer> {
    static func buildBlock(_ views: SomeView...) -> T {
        T.create(T.UIKitView.init(), subViews: views)
    }
    
    static func buildBlock(_ view: T.UIKitView, views: SomeView...) -> T {
        T.create(view, subViews: views)
    }
}

protocol SomeView: CustomDebugStringConvertible {
    var view: UIView { get }
}

extension SomeView where Self: UIKitContainer {
    init(@ViewBuilder<Self> builder: () -> Self) {
        self = builder()
    }
    
    init(builder: () -> ()) {
        builder()
        self = Self.create(Self.UIKitView.init(),subViews: [])
    }
    
    init() {
        self = Self.create(Self.UIKitView.init(),subViews: [])
    }
    
    var debugDescription: String {
        view.recursiveDescription()
    }
}

final class _HStack: UIView {}
struct XHStack: SomeView, UIKitContainer {
    var view: UIView { return _view }
    let _view: _HStack
    static func create(_ view: _HStack, subViews: [SomeView]) -> XHStack {
        subViews.forEach({
            view.addSubview($0.view)
        })
        return Self.init(_view: view)
    }
}

final class _VStack: UIView {}
struct VStack: SomeView, UIKitContainer {
    var view: UIView { return _view }
    let _view: _VStack
    static func create(_ view: _VStack, subViews: [SomeView]) -> VStack {
        subViews.forEach({
            view.addSubview($0.view)
        })
        return Self.init(_view: view)
    }
}

final class _ZStack: UIView {}
struct ZStack: SomeView, UIKitContainer {
    var view: UIView { return _view }
    let _view: _ZStack
    static func create(_ view: _ZStack, subViews: [SomeView]) -> ZStack {
        subViews.forEach({
            view.addSubview($0.view)
        })
        return Self.init(_view: view)
    }
}
