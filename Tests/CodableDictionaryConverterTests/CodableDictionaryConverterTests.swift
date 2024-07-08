import XCTest
@testable import CodableDictionaryConverter

final class CodableDictionaryConverterTests: XCTestCase {
    func testConvertToDictionary() throws {
        let testStruct = TestStruct(testVar: "Testing", testBool: true)
        let testDictionary = try testStruct.toDictionary()
        assert(testDictionary["testVar"] as? String == "Testing", "String did not store")
        assert(testDictionary["testBool"] as? Bool == true, "Bool did not store")
    }
    
    func testConvertFromDictionary() throws {
        let testDictionary: [AnyHashable : Any] = ["testVar": "Testing", "testBool": true]
        let testStruct = try TestStruct(dictionary: testDictionary)
        assert(testStruct.testVar == "Testing", "Did not decode String")
        assert(testStruct.testBool == true, "Did not decode Bool")
    }
}

struct TestStruct: Codable {
    let testVar: String
    let testBool: Bool
}
