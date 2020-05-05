//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import XCTest
@testable import SelectableStackView

class SelectableStackViewPropertyTests: XCTestCase {
    static var allTests = [
        ("testMultipleSelectionEnable", testMultipleSelectionEnable),
        ("testNoSelection", testNoSelection)
    ]
    
    func testMultipleSelectionEnable() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: singleSelection)
        stackView.multipleSelectionAllowed = true
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        stackView.multipleSelectionAllowed = false
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testNoSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndSingleSelection)
        stackView.noSelectionAllowed = false
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.noSelectionAllowed = true
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.noSelectionAllowed = false
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(true, at: 1)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        stackView.noSelectionAllowed = true
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(false, at: 1)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.noSelectionAllowed = false
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
    }
}
