//  Copyright © 2020 VladimirBrejcha. All rights reserved.

import XCTest
@testable import SelectableStackView

class SelectableStackViewDelegateTests: XCTestCase {
    static var allTests = [
        ("testSelectionFromButton", testSelectionFromButton)
    ]
    
    class SelectableStackViewDelegateRealisation: SelectableStackViewDelegate {
        let output: (Bool, Index, SelectableStackView) -> Void
        
        init(output: @escaping (Bool, Index, SelectableStackView) -> Void) {
            self.output = output
        }
        
        func didSelect(_ select: Bool, at index: Index, on selectableStackView: SelectableStackView) {
            output(select, index, selectableStackView)
        }
    }
    
    func testSelectionFromButton() {
        let (stackView, button1, button2, _) = makeStackWithSubviews(with: singleSelection)
        var selectedIndex: Int = -1
        var selectedValue: Bool = false
        let delegate = SelectableStackViewDelegateRealisation { selected, index, stackView2 in
            print("Delegate called with \(selected) at \(index)")
            XCTAssertTrue(stackView == stackView2)
            XCTAssertTrue(stackView === stackView2)
            selectedIndex = index
            selectedValue = selected
        }
        stackView.delegate = delegate
        
        button2.touchUp()
        
        XCTAssertTrue(selectedIndex == 1)
        XCTAssertTrue(selectedValue == true)
        
        button1.touchUp()
        
        XCTAssertTrue(selectedIndex == 0)
        XCTAssertTrue(selectedValue == true)
        
        stackView.noSelectionAllowed = true
        
        button1.touchUp()
        
        XCTAssertTrue(selectedIndex == 0)
        XCTAssertTrue(selectedValue == false)
    }
}
