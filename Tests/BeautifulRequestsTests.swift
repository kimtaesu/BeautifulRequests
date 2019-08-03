//
//  BeautifulRequestsTests.swift
//  BeautifulRequestsTests
//
//  Created by Tyler on 2019. 8. 3..
//  Copyright © 2019 Tyler. All rights reserved.
//

@testable import BeautifulRequests
import XCTest
import Stubber

class BeautifulRequestsTests: XCTestCase {

  var request: BeautifulRequests!
  var imageRequest: StubImageRequest!

  override func setUp() {
    super.setUp()
    imageRequest = StubImageRequest()
    request = BeautifulRequests(dispatching: SyncQueue.stubbedMain, request: imageRequest)
  }
  func testRetrieveImage() {
    Stubber.register(imageRequest.retrieveImage) { arg in
      arg.1(Result.success(UIImage()))
    }
    request.retrieveImage(with: URL(string: "test")!, completionHandler: { result in
        switch result {
        case .success:
          XCTAssertTrue(true)
        case .failure:
          XCTFail("fail")
        }
      })
    XCTAssertEqual(Stubber.executions(self.imageRequest.retrieveImage).count, 1)
  }
}


