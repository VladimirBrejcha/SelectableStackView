import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SelectableStackViewSelectionTests.allTests),
        testCase(SelectableStackViewInitialisationTests.allTests),
        testCase(SelectableStackViewPropertyTests.allTests)
    ]
}
#endif
