//
//  ViewController.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-02.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit
import Rswift
import XLPagerTabStrip

class ViewController: UIViewController, IndicatorInfoProvider {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.blueColor()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "JUZ'")
  }
  
  
}

