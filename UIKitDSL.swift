//
//  UIKitDSL.swift
//  Eduprime
//
//  Created by PondokIOS on 21/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import UIKit
import ARKit
import SceneKit
import SpriteKit
import WebKit
import MapKit
import MetalKit

import ViewDSL

extension ViewDSL {
    @discardableResult
    public func uStack(_ closure: (UIStackView) -> Void) -> UIStackView {
        return add { (this: UIStackView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uView(_ closure: (UIView) -> Void) -> UIView {
        return add { (this: UIView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uButton(with type: UIButton.ButtonType = .system,
                        apply closure: @escaping (UIButton) -> Void) -> UIButton {
        return add(UIButton(type: type)) { closure($0) }
    }
    
    @discardableResult
    public func uLabel(_ closure: (UILabel) -> Void) -> UILabel {
        return add { (this: UILabel) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uSegmentedControl(with items: [Any]? = nil,
                                  apply closure: @escaping (UISegmentedControl) -> Void) -> UISegmentedControl {
        return add(UISegmentedControl(items: items)) { closure($0) }
    }
    
    @discardableResult
    public func uTextField(_ closure: (UITextField) -> Void) -> UITextField {
        return add { (this: UITextField) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uSlider(_ closure: (UISlider) -> Void) -> UISlider {
        return add { (this: UISlider) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uUiswitch(_ closure: (UISwitch) -> Void) -> UISwitch {
        return add { (this: UISwitch) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uActivityIndicator(with style: UIActivityIndicatorView.Style = .white,
                                   apply closure: @escaping (UIActivityIndicatorView) -> Void) -> UIActivityIndicatorView {
        return add(UIActivityIndicatorView(style: style)) { closure($0) }
    }
    
    @discardableResult
    public func uProgress(with style: UIProgressView.Style = .default,
                          apply closure: @escaping (UIProgressView) -> Void) -> UIProgressView {
        return add(UIProgressView(progressViewStyle: style)) { closure($0) }
    }
    
    @discardableResult
    public func uPageControl(_ closure: (UIPageControl) -> Void) -> UIPageControl {
        return add { (this: UIPageControl) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uStepper(_ closure: (UIStepper) -> Void) -> UIStepper {
        return add { (this: UIStepper) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uTable(with style: UITableView.Style = .plain,
                       apply closure: @escaping (UITableView) -> Void) -> UITableView {
        return add(UITableView(frame: .zero, style: style)) { closure($0) }
    }
    
    @discardableResult
    public func uImage(_ closure: (UIImageView) -> Void) -> UIImageView {
        return add { (this: UIImageView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uCollection(_ closure: @escaping (UICollectionView) -> Void) -> UICollectionView {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        return add(collectionView) { closure($0) }
    }
    
    @discardableResult
    public func uTextView(_ closure: (UITextView) -> Void) -> UITextView {
        return add { (this: UITextView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uDatePicker(_ closure: (UIDatePicker) -> Void) -> UIDatePicker {
        return add { (this: UIDatePicker) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uScroll(_ closure: (UIScrollView) -> Void) -> UIScrollView {
        return add { (this: UIScrollView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uPicker(_ closure: (UIPickerView) -> Void) -> UIPickerView {
        return add { (this: UIPickerView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uSearchBar(_ closure: (UISearchBar) -> Void) -> UISearchBar {
        return add { (this: UISearchBar) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uToolbar(_ closure: (UIToolbar) -> Void) -> UIToolbar {
        return add { (this: UIToolbar) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uTabBar(_ closure: (UITabBar) -> Void) -> UITabBar {
        return add { (this: UITabBar) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uNavigationBar(_ closure: (UINavigationBar) -> Void) -> UINavigationBar {
        return add { (this: UINavigationBar) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uWebView(with config: WKWebViewConfiguration,
                         apply closure: @escaping (WKWebView) -> Void) -> WKWebView {
        return add(WKWebView(frame: .zero, configuration: config)) { closure($0) }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    public func uArSceneView(_ closure: (ARSCNView) -> Void) -> ARSCNView {
        return add { (this: ARSCNView) in
            closure(this)
        }
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    public func uArSpriteView(_ closure: (ARSKView) -> Void) -> ARSKView {
        return add { (this: ARSKView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uSceneView(_ closure: (SCNView) -> Void) -> SCNView {
        return add { (this: SCNView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uSpriteView(_ closure: (SKView) -> Void) -> SKView {
        return add { (this: SKView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uMap(_ closure: (MKMapView) -> Void) -> MKMapView {
        return add { (this: MKMapView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uMetal(_ closure: (MTKView) -> Void) -> MTKView {
        return add { (this: MTKView) in
            closure(this)
        }
    }
    
    @discardableResult
    public func uVisualEffect(with effect: UIVisualEffect? = nil,
                              apply closure: @escaping (UIVisualEffectView) -> Void) -> UIVisualEffectView {
        return add(UIVisualEffectView(effect: effect)) { closure($0) }
    }
}


