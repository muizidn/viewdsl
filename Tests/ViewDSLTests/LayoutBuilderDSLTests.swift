//
//  LayoutBuilderDSLTests.swift
//  ViewDSLTests
//
//  Created by PondokIOS on 20/03/19.
//  Copyright © 2019 PondokIT. All rights reserved.
//

import XCTest
import UIKit
@testable import ViewDSL

class LayoutBuilderDSLTests: XCTestCase {
    
    var view: View!

    override func setUp() {
        super.setUp()
        view = View()
    }

    override func tearDown() {
        view = nil
        super.tearDown()
    }
    
    final class Label:  InitializableLayoutBuilderDSL {
        static let text = UUID().uuidString
        init() {}
        var label: UILabel!
        
        func layout(_ dsl: ViewDSL) {
            dsl.add { [unowned self] (v: UILabel) in
                v.text = Label.text
                self.label = v
            }
        }
    }
    
    func testHasSubviewFromLayoutMethod() {
        let label = view.dsl(withInstanceOf: Label.self)
        XCTAssertTrue(view.subviews.contains(where: { $0 is UILabel }))
        XCTAssertTrue(view.subviews.contains(where: { $0 == label.label }))
        XCTAssertTrue(view.subviews.contains(label.label))
        XCTAssertEqual(label.label.text, Label.text)
    }

}
