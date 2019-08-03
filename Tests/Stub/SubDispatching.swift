//
//  SubDispatching.swift
//  BeautifulRequests-iOS
//
//  Created by tskim on 03/08/2019.
//  Copyright © 2019 Tyler. All rights reserved.
//
@testable import BeautifulRequests

extension SyncQueue {
  static let stubbedMain: SyncQueue = SyncQueue(queue: DispatchQueue(label: "stubbed-main-queue"))
}
