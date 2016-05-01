//
//  UIColor+Extension.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-09.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  convenience init(argbHex: String) {
    var red:CGFloat = 0.0
    var green:CGFloat = 0.0
    var blue:CGFloat = 0.0
    var alpha:CGFloat = 1.0
    
    if argbHex.hasPrefix("#"){
      
      let index   = argbHex.startIndex.advancedBy(1)
      let hex     = argbHex.substringFromIndex(index)
      let scanner = NSScanner(string: hex)
      var hexValue: CUnsignedLongLong = 0
      
      if scanner.scanHexLongLong(&hexValue)
      {
        if hex.characters.count == 6
        {
          red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
          green = CGFloat((hexValue & 0x00FF00) >> 8)  / 255.0
          blue  = CGFloat(hexValue & 0x0000FF) / 255.0
        }
        else if hex.characters.count == 8
        {
          alpha   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
          red = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
          green  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
          blue = CGFloat(hexValue & 0x000000FF)         / 255.0
        }
        else
        {
          print("invalid hex code string, length should be 7 or 9", terminator: "")
          self.init(white: 0, alpha: 1)
          return
        }
      }
      else
      {
        print("scan hex error")
        self.init(white: 0, alpha: 1)
        return
      }
    }

    self.init(
      red: CGFloat(red),
      green: CGFloat(green),
      blue: CGFloat(blue),
      alpha: CGFloat(alpha)
    )
  }
}
