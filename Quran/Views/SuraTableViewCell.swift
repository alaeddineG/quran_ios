//
//  SuraTableViewCell.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-08.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

class SuraTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var suraNameLabel: UILabel!
  @IBOutlet weak var suraDescriptionLabel: UILabel!
  @IBOutlet weak var suraNumberLabel: UILabel!
  @IBOutlet weak var startPageLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
