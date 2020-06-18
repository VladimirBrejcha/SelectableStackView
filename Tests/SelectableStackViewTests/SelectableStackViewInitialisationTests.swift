//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import XCTest
@testable import SelectableStackView

class SelectableStackViewInitialisationTests: XCTestCase {
    static var allTests = [
        ("testInit", testInit),
        ("testInitAddSelection", testInitAddSelection),
        ("testInitAddNoSelection", testInitAddNoSelection),
        ("testDeinit", testDeinit)
    ]
    
    func testInit() {
        let button1 = SelectableButton()
        let button2 = SelectableButton()
        let stackView = SelectableStackView(arrangedSubviews: [button1, button2])
        XCTAssertTrue(stackView.arrangedSubviews.count == 2)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
    }
    
    func testInitAddSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: singleSelection)
        XCTAssertTrue(stackView.arrangedSubviews.count == 3)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testInitAddNoSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndSingleSelection)
        XCTAssertTrue(stackView.arrangedSubviews.count == 3)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testDeinit() {
        let button1 = SelectableButton()
        let button2 = SelectableButton()
        weak var stackView = SelectableStackView(arrangedSubviews: [button1, button2])
        XCTAssertTrue(stackView == nil)
    }
}
