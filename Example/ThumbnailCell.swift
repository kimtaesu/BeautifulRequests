//
//  ThumbnailCell.swift
//  MediaSearch
//
//  Created by tskim on 20/07/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import Foundation
import UIKit

class ThumbnailCell: UICollectionViewCell {

  @IBOutlet weak var thumbnail: UIImageView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  static let reuseableKey = "ThumbnailCell"
  
  static var nib: UINib {
    return UINib(nibName: String(describing: "ThumbnailCell"), bundle: nil)
  }
}
