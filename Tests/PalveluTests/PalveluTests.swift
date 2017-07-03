import XCTest
@testable import Palvelu

final class PalveluTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Palvelu().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
