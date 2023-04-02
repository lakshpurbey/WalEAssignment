//
//  ApodVMTest.swift
//  WalEAssignmentTests
//
//  Created by Mac on 02/04/2023.
//

import XCTest
@testable import WalEAssignment

class ApodVMTest: XCTestCase {

    var sut: ApodHomeViewModel!

    override func setUpWithError() throws {
        sut = ApodHomeViewModel()
    }
    override func tearDownWithError() throws {
        sut = nil
    }

    func testUpdateQueryDate() {

        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.ApodDateFormat
        let dateString = dateFormatter.string(from: date)

        sut.updateQueryDate(queryDate: Date())

        XCTAssertEqual(dateString as NSString, sut.queryDate )

        let testDate = dateFormatter.date(from: "2023-04-02")
        sut.updateQueryDate(queryDate: testDate!)

        XCTAssertEqual("2023-04-02" as NSString, sut.queryDate )

    }

    func testUpdateData() {

        var response = ApodResponse(date: "testDate", title: "testTitle", explanation: "testExp", url: "testUrl", media_type: "image")

        sut.updateResponse(apodApiResponse: response)

        XCTAssertEqual("testDate", sut.date )
        XCTAssertEqual("testTitle", sut.title )
        XCTAssertEqual("testExp", sut.explanation )
        XCTAssertEqual("testUrl", sut.url )
        XCTAssertEqual(Constants.MediaType.image, sut.media_type )

        response = ApodResponse(date: "testDate", title: "testTitle", explanation: "testExp", url: "testUrl", media_type: "video")

        sut.updateResponse(apodApiResponse: response)

        XCTAssertEqual(Constants.MediaType.video, sut.media_type )
    }
}

