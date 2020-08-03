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
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(false, at: 0)
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(true, at: 1)
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
    }
    
    func testMultipleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: multipleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(false, at: 0)
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(true, at: 1)
        XCTAssertTrue(button1.isSelected )
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
    }
    
    func testNoSelectionSingleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndSingleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(false, at: 0)
        XCTAssertFalse(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(true, at: 1)
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
    }
    
    func testNoSelectionMultipleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndMultipleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(false, at: 0)
        XCTAssertFalse(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(true, at: 1)
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
        stackView.select(true, at: 2)
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertTrue(button3.isSelected )
    }
    
    func testObserverSingleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: singleSelection)
        
        button1.touchUp()
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
    }
    
    func testObserverSingleSelectionSelfHandling() {
        let (stackView, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: singleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
    }
    
    func testObserverMultipleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: multipleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertTrue(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
    }
    
    func testObserverMultipleSelectionSelfHandling() {
        let (stackView, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: multipleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertTrue(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected )
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
    }
    
    func testObserverNoSelectionSingleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndSingleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
    }
    
    func testObserverNoSelectionSingleSelectionSelfHandling() {
        let (stackView, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: noSelectionAndSingleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected )
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
    }
    
    func testObserverNoSelectionMultipleSelection() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: noSelectionAndMultipleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertTrue(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
    }
    
    func testObserverNoSelectionMultipleSelectionSelfHandling() {
        let (_, button1, button2, button3) = makeStackWithSelfHandlingSubviews(with: noSelectionAndMultipleSelection)
        button1.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertTrue(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
    }
    
    func testSelectionAndObserver() {
        let (stackView, button1, button2, button3) = makeStackWithSubviews(with: singleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
    }
    
    func testSelectionAndObserverSelfHandling() {
        let (stackView, button1, button2, button3)
            = makeStackWithSelfHandlingSubviews(with: singleSelection)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        button2.touchUp()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        stackView.select(true, at: 0)
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
    }
}
