//
//  StackViewDSL.swift
//  ViewDSLTests
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import XCTest
import UIKit
@testable import ViewDSL

class StackViewDSLTests: XCTestCase {

    private var view: UIStackView!
    
    override func setUp() {
        super.setUp()
        view = UIStackView()
    }
    
    override func tearDown() {
        view = nil
        super.tearDown()
    }
    
    func testHasArrangedSubview() {
        let subview = view.stackAdd { (v: UIView) in }
        XCTAssertTrue(view.subviews.contains(subview))
        XCTAssertTrue(view.arrangedSubviews.contains(subview))
    }
    
    func testReturnArrangedSubviewObject() {
        var identifier: ObjectIdentifier!
        let subview = view.stackAdd { (v: UIView) in
            identifier = ObjectIdentifier(v)
        }
        
        XCTAssertEqual(ObjectIdentifier(subview), identifier)
    }
    
    func testCanApplyTransformationInClosure() {
        let text = UUID().uuidString
        
        let label = view.stackAdd { (v: UILabel) in
            v.text = text
        }
        
        XCTAssertEqual(label.text, text)
    }
    
    func testAddingSubviewPerformance() {
        // This is an example of a performance test case.
        self.measure {
            view.add { (v: UIView) in }
        }
    }}
