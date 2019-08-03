//
//  BeautifulRequests.swift
//  BeautifulRequests
//
//  Created by Tyler on 2019. 8. 3..
//  Copyright © 2019 Tyler. All rights reserved.
//

// Include Foundation
@_exported import Foundation

import UIKit

class BeautifulRequests {
  static let shared = BeautifulRequests(
    dispatching: AsyncQueue.background,
    request: ImageRequest.repository
  )

  let request: ImageRequestable

  let dispatching: Dispatching
  init(dispatching: Dispatching, request: ImageRequestable) {
    self.dispatching = dispatching
    self.request = request
  }

  func retrieveImage(with url: URL?, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
    let workItem = DispatchWorkItem(qos: .default, flags: .noQoS) { [weak self] in
      guard let self = self else {
        return
      }
      guard let url = url else {
        completionHandler(Result.failure(BeautifulErrors.invalidURL))
        return
      }
      // 메모리 캐시에 존재하면 메모리 캐시로 부터 가져온다.

      // 디스크 캐시에 존재하면 디스크 캐시로 부터 가져온다.

      // 캐시에 없다면 원본 소스로 부터 가져온다.

      self.request.retrieveImage(with: url, completionHandler: completionHandler)
    }
    
    dispatching.dispatch(item: workItem)
//    dispatching.dispatch { [weak self] in
//      guard let self = self else {
//        return
//      }
//      guard let url = url else {
//        completionHandler(Result.failure(BeautifulErrors.invalidURL))
//        return
//      }
//      // 메모리 캐시에 존재하면 메모리 캐시로 부터 가져온다.
//
//      // 디스크 캐시에 존재하면 디스크 캐시로 부터 가져온다.
//
//      // 캐시에 없다면 원본 소스로 부터 가져온다.
//
//      self.request.retrieveImage(with: url, completionHandler: completionHandler)
//    }
  }
}
