//
//  ViewController.swift
//  Example
//
//  Created by Tyler on 2019. 8. 3..
//  Copyright © 2019 Tyler. All rights reserved.
//

import UIKit
import BeautifulRequests

// MARK: - ViewController

/// The ViewController
class ViewController: UIViewController {

  var images = DataProvider().images
  // MARK: Properties
  let collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    cv.register(ThumbnailCell.nib, forCellWithReuseIdentifier: ThumbnailCell.reuseableKey)
    return cv
  }()


  // MARK: View-Lifecycle

  /// View did load
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
  }

  /// LoadView
  override func loadView() {
    self.view = self.collectionView
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
  }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCell.reuseableKey, for: indexPath) as? ThumbnailCell else {
      return UICollectionViewCell()
    }
    cell.thumbnail.beautiful.setImage(with: URL(string: images[indexPath.item]))
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    guard let collectionViewLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize(width: 0, height: 0) }
    let column = 3
    let sectionInset = collectionViewLayout.sectionInset

    var contentWidth = collectionView.frame.width
    if #available(iOS 11.0, *) {
      contentWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
    }
    
    let localContentWidth = contentWidth
      - sectionInset.left
      - sectionInset.right
      - collectionView.contentInset.left
      - collectionView.contentInset.right
      - collectionViewLayout.minimumInteritemSpacing * CGFloat((column - 1))

    let referenceWidth = localContentWidth / CGFloat(column)

    return CGSize(width: referenceWidth, height: referenceWidth)
  }
}
