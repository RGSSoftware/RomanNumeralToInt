import XCTest
@testable import RomanNumeralToInt

class RomanNumeralToIntTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRomanNumeralToInt() {
        do {
            
            XCTAssertEqual(try "LXXVIII".romanNumeralToInt(), 78)
            XCTAssertEqual(try "LXXXIX".romanNumeralToInt(), 89)
            XCTAssertEqual(try "II".romanNumeralToInt(), 2)
            XCTAssertEqual(try "IV".romanNumeralToInt(), 4)
            
            XCTAssertEqual(try "V".romanNumeralToInt(), 5)
            
            XCTAssertThrowsError(try "".romanNumeralToInt())
            XCTAssertThrowsError(try "abc".romanNumeralToInt())
            XCTAssertThrowsError(try "LXXVIIIC".romanNumeralToInt())
        }
    }
    
}
