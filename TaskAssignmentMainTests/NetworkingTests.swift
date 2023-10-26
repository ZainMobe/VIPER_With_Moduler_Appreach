//
//  NetworkingTests.swift
//  TaskAssignmentMainTests
//
//  Created by Zain Haider on 26/10/2023.
//

import XCTest
@testable import TaskAssignmentMain


struct TestResponseObject: Codable {
    let name: String
}

final class NetworkingTests: XCTestCase {

    func testDataParsing() throws {
        let testJson = "{\"name\": \"Zain\"}"
        let data = testJson.data(using: .utf8)
        XCTAssertNotNil(data)
        let object: TestResponseObject = try NetworkManager.shared.parseData(data!)
        XCTAssertEqual(object.name, "Zain")
    }
    
    func testURLParser() {
        let baseURL = "http://universities.hipolabs.com/"
        let endpoint = "search"
        let params: [String: String] = ["name": "Zain"]
        let componenet = NetworkManager.shared.urlParser(baseURL: baseURL, endPoint: endpoint, params: params)
        XCTAssertNotNil(componenet)
        XCTAssertNotNil(componenet?.url)
        XCTAssertEqual(componenet!.path, "/search")
        XCTAssertEqual(componenet!.string, "http://universities.hipolabs.com/search?name=Zain")
        let queryItem = componenet?.queryItems?.first
        XCTAssertNotNil(queryItem)
        let ppparams = queryItem!.name
        XCTAssertEqual(queryItem!.name, "name")
        XCTAssertEqual(queryItem!.value, "Zain")
    }

}
