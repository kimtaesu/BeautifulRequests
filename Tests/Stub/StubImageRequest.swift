//
//  StubImageRequest.swift
//  BeautifulRequests-iOS
//
//  Created by tskim on 03/08/2019.
//  Copyright © 2019 Tyler. All rights reserved.
//

@testable import BeautifulRequests
import UIKit
import Stubber

final class StubImageRequest: ImageRequestable {
  
  func retrieveImage(with url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
    Stubber.invoke(retrieveImage, args: escaping(url, completionHandler), default: Void())
  }
}
