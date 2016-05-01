//
//  UIView+Extension.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-03.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  
  func allSubviewsRecursively() -> NSArray {
    let allSubviews = NSMutableArray()
    
    for view in self.subviews {
      allSubviews.addObjectsFromArray(view.allSubviewsRecursively() as [AnyObject])
    }
    return allSubviews
  }
  
  
  func allSubviewsWithClass(aClass: AnyClass) -> NSArray {
    
    let filteredClass = self.allSubviewsRecursively().filter { (obj) -> Bool in
      return obj.isKindOfClass(aClass)
    }
    
    
    return filteredClass
  }

  func subviewsWithClass(aClass : AnyClass) -> [UIView] {
    var views : [UIView]
    views = self.subviews.filter{
      $0.isKindOfClass(aClass)
    }
    return views
  }
 
  var x : CGFloat {
    
    get {
      return self.frame.origin.x
    }
    
    set (newOriginX){
      var frame = self.frame
      frame.origin.x = newOriginX
      self.frame = frame
    }
  }
  
  var y : CGFloat {
    
    get {
      return self.frame.origin.y
    }
    
    set (newOriginY){
      var frame = self.frame
      frame.origin.y = newOriginY
      self.frame = frame
    }
  }
 
  var width : CGFloat {
    
    get {
      return self.frame.size.width
    }
    
    set (newWidth){
      var frame = self.frame
      frame.size.width = newWidth
      self.frame = frame
    }
  }
 
  
  var height : CGFloat {
    get {
      return self.frame.size.height
    }
    set (newHeight){
      var frame = self.frame
      frame.size.height = newHeight
      self.frame = frame
    }
  }  }
  
  var centerX : CGFloat {
    get {
      return self.center.x
    }
    set (newCenterX){
      var center = self.center
      center.x = newCenterX
      self.center = center
    }
  }
  
  var centerY : CGFloat {
    get {
      return self.center.y
    }
    set (newCenterY){
      var center = self.center
      center.x = newCenterY
      self.center = center
    }
  }
  
}
