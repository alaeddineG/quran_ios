//
//  JuzTableViewCell.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-08.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

class JuzTableViewCell: UITableViewCell {
  
  @IBOutlet weak var juzButton: UIButton!
  @IBOutlet weak var startPageLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    juzButton.contentHorizontalAlignment = .Left
    juzButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
