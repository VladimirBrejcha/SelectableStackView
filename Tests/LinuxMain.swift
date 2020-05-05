import XCTest

import SingleSelectableStackViewTests

var tests = [XCTestCaseEntry]()
tests += SelectableStackViewSelectionTests.allTests()
tests += SelectableStackViewPropertyTests.allTests()
tests += SelectableStackViewInitialisationTests.allTests()
XCTMain(tests)
