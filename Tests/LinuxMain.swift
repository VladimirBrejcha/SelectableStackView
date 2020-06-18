import XCTest

import SingleSelectableStackViewTests

var tests = [XCTestCaseEntry]()
tests += SelectableStackViewSelectionTests.allTests()
tests += SelectableStackViewPropertyTests.allTests()
tests += SelectableStackViewInitialisationTests.allTests()
tests += SelectableStackViewSelectionTests.allTests()
XCTMain(tests)
