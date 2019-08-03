//
//  ImageRepositoryProtocol.swift
//  BeautifulRequests-iOS
//
//  Created by tskim on 03/08/2019.
//  Copyright © 2019 Tyler. All rights reserved.
//
import UIKit

protocol ImageRepository: class {
  func retrieveImage(with url: URL, completionHandler: @escaping (Result<UIImage, Error>) -> Void)
}
