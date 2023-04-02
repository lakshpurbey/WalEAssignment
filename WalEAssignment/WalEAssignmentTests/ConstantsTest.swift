//
//  ConstantsTest.swift
//  WalEAssignmentTests
//
//  Created by Mac on 02/04/2023.
//

import XCTest
@testable import WalEAssignment

class ConstantsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testConstantValues() throws {

        XCTAssertEqual(Constants.ApodDateFormat, "yyyy-MM-dd")
        XCTAssertEqual(Constants.CalenderImage, "calender")
        XCTAssertEqual(Constants.NoImage, "no-image-icon")
        XCTAssertEqual(Constants.ErrorAlertTitle, "Error")
        XCTAssertEqual(Constants.OkAlertTitle, "Ok")
        XCTAssertEqual(Constants.CancelAlertTitle, "Cancel")
        XCTAssertEqual(Constants.MediaTypeImage, "image")
        XCTAssertEqual(Constants.MediaTypeVideo, "video")

    }

    func testAPIKEY() throws {

        var config: [String: Any]?
        if let infoPlistPath = Bundle.main.url(forResource: "Info", withExtension: "plist") {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)
                if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: Any] {
                    config = dict
                }
            } catch {
                print(error)
            }
        }
        let apiKey =  config?["APOD_KEY"] as? String ?? ""
        XCTAssertEqual(Constants.getAPIKey(), apiKey)

        //Test Base URL

        let baseURL =  config?["BASE_URL"] as? String ?? ""
        XCTAssertEqual(Constants.getApodBaseURL(), baseURL)

    }


}
