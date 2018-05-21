import XCTest

@testable import PalveluDataTests

XCTMain([
    testCase(TestArraySet.allTests),
    testCase(TestCache.allTests),
])
