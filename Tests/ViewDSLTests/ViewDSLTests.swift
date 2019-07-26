//
//  ViewDSLTests.swift
//  ViewDSLTests
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import XCTest
import UIKit
@testable import ViewDSL

class ViewDSLTests: XCTestCase {
    
    private var view: View!
    
    override func setUp() {
        super.setUp()
        view = View()
    }

    override func tearDown() {
        view = nil
        super.tearDown()
    }
    
    func testHasSubview() {
        let subview = view.add { (v: View) in }
        XCTAssertTrue(view.subviews.contains(subview))
    }

    func testReturnSubviewObject() {
        var identifier: ObjectIdentifier!
        let subview = view.add { (v: View) in
            identifier = ObjectIdentifier(v)
        }
        
        XCTAssertEqual(ObjectIdentifier(subview), identifier)
    }

    func testCanApplyTransformationInClosure() {
        let text = UUID().uuidString
        
        let label = view.add { (v: UILabel) in
            v.text = text
        }
        
        XCTAssertEqual(label.text, text)
    }
    
    func testAddingSubviewPerformance() {
        // This is an example of a performance test case.
        self.measure {
            view.add { (v: View) in }
        }
    }

}
