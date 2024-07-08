# CodableDictionaryConverter

Adding seemingly missing features from Codable to initialize a codable object from a dictionary and to convert a codable object into a dictionary.

Usage:

```swift
struct TestStruct: Codable {
    let testVar: String
    let testBool: Bool
}
    
let dictionary: [AnyHashable : Any] = ["testVar": "Testing", "testBool": true]
let struct = try TestStruct(dictionary: dictionary)
print(struct.testVar) //"Testing"

let convertedDictionary = try struct.toDictionary()
print(convertedDictionary["testVar"] as? String) //Optional("Testing")

```
