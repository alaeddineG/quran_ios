//
//  GradientView.swift
//  Quran
//
//  Created by Alaeddine Gallas on 2016-04-17.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

class GradientView: UIView {
  
  // Default Colors
  var colors:[UIColor] = [UIColor.blackColor().colorWithAlphaComponent(0.2), UIColor.clearColor()]
  
  var parentViewFrame : CGRect = CGRectZero
  var page : Int = 1
  
  init(frame: CGRect, page:Int, parentViewFrame: CGRect ) {
    super.init(frame: frame)
    self.parentViewFrame = parentViewFrame
    self.page = page
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func drawRect(rect: CGRect) {
    
    // Must be set when the rect is drawn
    setGradient(colors[0], color2: colors[1])
  }
  
  func setGradient(color1: UIColor, color2: UIColor) {
    
    let context = UIGraphicsGetCurrentContext()
    let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [color1.CGColor, color2.CGColor], [1, 0])!
    
    // Draw Path
    let path = UIBezierPath(rect: CGRectMake(0, 0, frame.width, frame.height))
    CGContextSaveGState(context)
    path.addClip()
//    CGContextDrawLinearGradient(context, gradient, CGPointMake(frame.width, frame.height / 2), CGPointMake(0, frame.height / 2), CGGradientDrawingOptions())
    CGContextDrawLinearGradient(context, gradient, self.startPoint(), self.endPoint(), CGGradientDrawingOptions())
    CGContextRestoreGState(context)
  }
  
  func startPoint() -> CGPoint {
    return self.page % 2 == 0 ? CGPointMake(0, frame.height / 2): CGPointMake(frame.width, frame.height / 2)
  }
  
  func endPoint() -> CGPoint {
    return self.page % 2 == 0 ? CGPointMake(frame.width, frame.height / 2) : CGPointMake(0, frame.height / 2)
  }
  
  override func layoutSubviews() {
    
    // Ensure view has a transparent background color (not required)
    backgroundColor = UIColor.clearColor()
  }
  
  static func bookShadowForPage(page:Int, inImageView imageViewRect:CGRect) -> GradientView {
    let x = page % 2 == 1 ? 0 : (imageViewRect.width - (imageViewRect.width/6))
    let rect = CGRectMake(x, 0, (imageViewRect.width/6), imageViewRect.height)
    return GradientView(frame: rect, page: page, parentViewFrame: imageViewRect)
  }
  
}