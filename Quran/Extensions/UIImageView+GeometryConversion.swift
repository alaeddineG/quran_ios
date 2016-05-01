//
//  UIImageView+GeometryConversion.swift
//
//  Created by Alaeddine Gallas on 2016-04-01.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
  
  func convertPointFromImage(imagePoint : CGPoint) -> CGPoint {
    
    var viewPoint = imagePoint;
    
    let ratioX = self.viewSize.width / self.imageSize.width;
    let ratioY = self.viewSize.height / self.imageSize.height;
    
    switch self.contentMode {
    case .ScaleToFill, .Redraw:
      viewPoint.x *= ratioX;
      viewPoint.y *= ratioY;
      break;
    case .ScaleAspectFit, .ScaleAspectFill:
      var scale : CGFloat
      
      if (contentMode == .ScaleAspectFit) {
        scale = min(ratioX, ratioY)
      }
      else /*if (contentMode == .ScaleAspectFill)*/ {
        scale = max(ratioX, ratioY)
      }
      
      viewPoint.x *= scale;
      viewPoint.y *= scale;
      
      viewPoint.x += (viewSize.width  - imageSize.width  * scale) / 2.0
      viewPoint.y += (viewSize.height - imageSize.height * scale) / 2.0
      break;
    case .Center :
      viewPoint.x += viewSize.width / 2.0  - imageSize.width  / 2.0
      viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0
      break
    case .Top:
      viewPoint.x += viewSize.width / 2.0 - imageSize.width / 2.0
      break;
    case .Bottom:
      viewPoint.x += viewSize.width / 2.0 - imageSize.width / 2.0
      viewPoint.y += viewSize.height - imageSize.height
      break;
    case .Left:
      viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0
      break
    case .Right:
      viewPoint.x += viewSize.width - imageSize.width
      viewPoint.y += viewSize.height / 2.0 - imageSize.height / 2.0
      break
    case .TopRight:
      viewPoint.x += viewSize.width - imageSize.width
      break
    case .BottomLeft:
      viewPoint.y += viewSize.height - imageSize.height;
      break
    case .BottomRight:
      viewPoint.x += viewSize.width  - imageSize.width
      viewPoint.y += viewSize.height - imageSize.height
      break
    //case .TopLeft:
    default:
      break
    }
    
    return viewPoint
  }
  
  func convertRectFromImage(imageRect : CGRect) -> CGRect {
    let imageTopLeft = imageRect.origin
    let imageBottomRight = CGPointMake(CGRectGetMaxX(imageRect),
                                       CGRectGetMaxY(imageRect))
    
    let viewTopLeft = convertPointFromImage(imageTopLeft)
    let viewBottomRight = convertPointFromImage(imageBottomRight)
    
    var viewRect = CGRect()
    
    viewRect.origin = viewTopLeft
    viewRect.size = CGSizeMake(abs(viewBottomRight.x - viewTopLeft.x),
                               abs(viewBottomRight.y - viewTopLeft.y))
    
    return viewRect;
  }
  
  
  func convertPointFromView(viewPoint : CGPoint) -> CGPoint {
    
    var imagePoint = viewPoint;
    
    let ratioX = self.viewSize.width / self.imageSize.width;
    let ratioY = self.viewSize.height / self.imageSize.height;
    
    switch self.contentMode {
    case .ScaleToFill, .Redraw:
      imagePoint.x /= ratioX;
      imagePoint.y /= ratioY;
      break;
    case .ScaleAspectFit, .ScaleAspectFill:
      
      var scale : CGFloat
      
      if (contentMode == .ScaleAspectFit) {
        scale = min(ratioX, ratioY)
      }
      else /*if (contentMode == .ScaleAspectFill)*/ {
        scale = max(ratioX, ratioY)
      }
      
      imagePoint.x -= (viewSize.width  - imageSize.width  * scale) / 2.0
      imagePoint.y -= (viewSize.height - imageSize.height * scale) / 2.0
      
      imagePoint.x /= scale;
      imagePoint.y /= scale;
      break;
    case .Center :
      imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
      imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
      break
    case .Top:
      imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
      break;
    case .Bottom:
      imagePoint.x -= (viewSize.width - imageSize.width)  / 2.0
      imagePoint.y -= (viewSize.height - imageSize.height)
      break;
    case .Left:
      imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
      break
    case .Right:
      imagePoint.x -= (viewSize.width - imageSize.width)
      imagePoint.y -= (viewSize.height - imageSize.height) / 2.0
      break
    case .TopRight:
      imagePoint.x -= (viewSize.width - imageSize.width)
      break
    case .BottomLeft:
      imagePoint.y -= (viewSize.height - imageSize.height)
      break
    case .BottomRight:
      imagePoint.x -= (viewSize.width - imageSize.width);
      imagePoint.y -= (viewSize.height - imageSize.height);
      
      break
    //case .TopLeft:
    default:
      break
    }
    
    return imagePoint
  }
  
  func convertRectFromView(viewRect: CGRect) -> CGRect {
    
    let viewTopLeft = viewRect.origin;
    let viewBottomRight = CGPointMake(CGRectGetMaxX(viewRect),
                                      CGRectGetMaxY(viewRect));
    
    let imageTopLeft = convertPointFromView(viewTopLeft)
    let imageBottomRight = convertPointFromView(viewBottomRight)
    
    var imageRect = CGRect()
    imageRect.origin = imageTopLeft;
    imageRect.size = CGSizeMake(abs(imageBottomRight.x - imageTopLeft.x),
                                abs(imageBottomRight.y - imageTopLeft.y));
    
    return imageRect;
  }
  
  var imageSize: CGSize {
    return (self.image?.size)!
  }
  
  var viewSize: CGSize {
    return self.bounds.size
  }
  
}
