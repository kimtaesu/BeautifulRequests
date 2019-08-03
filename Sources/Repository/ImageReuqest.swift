//
//  ImageReuqest.swift
//  BeautifulRequests-iOS
//
//  Created by tskim on 03/08/2019.
//  Copyright © 2019 Tyler. All rights reserved.
//

import UIKit

protocol ImageRequestable {
  func retrieveImage(with url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void)
}
class ImageRequest {
  
  static let repository = ImageRequest(remoteSource: ImageRemoteSource())
  
  let remoteSource: ImageRemoteSource
  init(remoteSource remote: ImageRemoteSource) {
    self.remoteSource = remote
  }
}

extension ImageRequest: ImageRequestable {
  func retrieveImage(with url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
    assertBackgroundThread()
    self.remoteSource.retrieveImage(with: url, completionHandler: completionHandler)
  }
}
