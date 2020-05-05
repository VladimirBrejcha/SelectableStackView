//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import XCTest
@testable import SelectableStackView

class SelectableStackViewSelectionTests: XCTestCase {
    static var allTests = [
        ("testSingleSelection", testSingleSelection),
        ("testMultipleSelection", testMultipleSelection),
        ("testNoSelectionSingleSelection", testNoSelectionSingleSelection),
        ("testNoSelectionMultipleSelection", testNoSelectionMultipleSelection),
        ("testObserverSingleSelection", testObserverSingleSelection),
        ("testObserverSingleSelectionSelfHandling", testObserverSingleSelectionSelfHandling),
        ("testObserverMultipleSelection", testObserverMultipleSelection),
        ("testObserverMultipleSelectionSelfHandling", testObserverMultipleSelectionSelfHandling),
        ("testObserverNoSelectionSingleSelection", testObserverNoSelectionSingleSelection),
        ("testObserverNoSelectionSingleSelectionSelfHandling", testObserverNoSelectionSingleSelectionSelfHandling),
        ("testObserverNoSelectionMultipleSelection", testObserverNoSelectionMultipleSelection),
        ("testObserverNoSelectionMultipleSelectionSelfHandling", testObserverNoSelectionMultipleSelectionSelfHandling),
        ("testSelectionAndObserver", testSelectionAndObserver),
        ("testSelectionAndObserverSelfHandling", testSelectionAndObserverSelfHandling)
    ]
    
    func testSingleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: singleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(false, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(true, at: 1)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testMultipleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: multipleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(false, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(true, at: 1)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testNoSelectionSingleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndSingleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(false, at: 0)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(true, at: 1)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testNoSelectionMultipleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndMultipleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(false, at: 0)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(true, at: 1)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(true, at: 2)
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == true)
    }
    
    func testObserverSingleSelection() {
        let (_, button1, button2, button3) = makeStackWithSubviews(with: singleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testObserverSingleSelectionSelfHandling() {
        let (_, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: singleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testObserverMultipleSelection() {
        let (_, button1, button2, button3) = makeStackWithSubviews(with: multipleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testObserverMultipleSelectionSelfHandling() {
        let (_, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: multipleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testObserverNoSelectionSingleSelection() {
        let (_, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndSingleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testObserverNoSelectionSingleSelectionSelfHandling() {
        let (_, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: noSelectionAndSingleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testObserverNoSelectionMultipleSelection() {
        let (_, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndMultipleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testObserverNoSelectionMultipleSelectionSelfHandling() {
        let (_, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: noSelectionAndMultipleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testSelectionAndObserver() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: singleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
    
    func testSelectionAndObserverSelfHandling() {
        let (stackView, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: singleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected == false)
        XCTAssertTrue(button2.isSelected == true)
        XCTAssertTrue(button3.isSelected == false)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected == true)
        XCTAssertTrue(button2.isSelected == false)
        XCTAssertTrue(button3.isSelected == false)
    }
}
