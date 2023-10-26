//
//  RealmTests.swift
//  TaskAssignmentMainTests
//
//  Created by Zain Haider on 26/10/2023.
//

import XCTest
@testable import TaskAssignmentMain
import RealmSwift

class TestObject: Object {
    @objc dynamic var name = ""
}

final class RealmTests: XCTestCase {
    
    func testStorageOperation() throws {
        let list = List<TestObject>()
        let testObject = TestObject()
        testObject.name = "Zain"
        list.append(testObject)
        try RealmStorage.shared.storeObjects(list)
    }
    
    func testReadOperation() throws {
        try testStorageOperation()
        
        let retrivedObject = try RealmStorage.shared.getObjectsFromDB(TestObject.self)
        let name = (retrivedObject.first as? TestObject)?.name ?? ""
        XCTAssertEqual(name, "Zain")
    }
    
    func testDeleteOperation() throws {
        try testStorageOperation()
        
        try RealmStorage.shared.deleteAll()
        
        let retrivedObject = try RealmStorage.shared.getObjectsFromDB(TestObject.self)
        let count = retrivedObject.count
        
        XCTAssertEqual(count, 0)
    }

}
