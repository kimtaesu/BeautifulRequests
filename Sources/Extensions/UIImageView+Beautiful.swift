//
//  UIImageView+ Beautiful.swift
//  BeautifulRequests
//
//  Created by tskim on 24/07/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import UIKit

extension BeautifulWrapper where Base: UIImageView {

  public func cancel() {
    self.imageTask?.cancel?()
  }
  public func setImage(with url: URL?, onCancelled: ((Error) -> Void)? = nil) {
    guard let url = url else {
      return
    }
    var mutatingSelf = self
    mutatingSelf.imageTask = BeautifulRequests.shared.retrieveImage(with: url, completionHandler: { result in
      DispatchQueue.main.async {
        assertMainThread()
        mutatingSelf.imageTask = nil
        switch result {
        case .success(let image):
          self.base.image = image
          print("successed to download \(String(describing: url))")
        case .failure(let error):
          switch error {
          case is BeautifulError:
            onCancelled?(error)
          default:
            break
          }
          print("failed to download: \(error)")
        }
      }
    })
  }
}

private var imageTaskKey = "imageTaskKey"
extension BeautifulWrapper: AssociatedObjectStore where Base: UIImageView {
  private var imageTask: ImageTask? {
    get { return self.associatedObject(forKey: &imageTaskKey, default: ImageTask()) }
    set { self.setAssociatedObject(newValue, forKey: &imageTaskKey) }
  }
}
