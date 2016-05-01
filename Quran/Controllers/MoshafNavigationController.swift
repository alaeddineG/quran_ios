//
//  MoshafNavigationController.swift
//  Quran
//
//  Created by Alaeddine Gallas on 2016-04-16.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

class MoshafNavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.translucent = true
    self.navigationController?.view.backgroundColor = .clearColor()
    self.navigationBar.backgroundColor = UIColor.darkGrayColor()
    self.navigationBar.alpha = 0.66
    
    
  }
}
