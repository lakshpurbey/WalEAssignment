//
//  ApodVCTest.swift
//  WalEAssignmentUITests
//
//  Created by Mac on 02/04/2023.
//

import XCTest
import Foundation

@testable import WalEAssignment

class ApodVCTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testChooseDate() {
        let app = XCUIApplication()
            app.launch()
    }

    func createEntry(app: XCUIApplication, desc: String){
           let textField = app.textFields["Select Date"]
           textField.tap()
           // Line 7
           app.datePickers.buttons["Done"].tap()
       }
}
