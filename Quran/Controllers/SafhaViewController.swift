//
//  SafhaViewController.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-09.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit
import Toast
import CoreGraphics

protocol SafhaControllerDelegate {
  func needToShowMenusSafhaViewController(safhaViewController: SafhaViewController) -> Void;
  func needToHideMenusSafhaViewController(safhaViewController: SafhaViewController) -> Void;
  func toggleMenusSafhaViewController(safhaViewController: SafhaViewController) -> Void;
  func safhaViewController(safhaViewController: SafhaViewController, didAppearForPage page: Int) -> Void;
}

class SafhaViewController: UIViewController, UIGestureRecognizerDelegate {
  
  var page : Int! = 1
  var imageView : UIImageView!
  var delegate : SafhaControllerDelegate!;
  
  @IBOutlet weak var safhScroll: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.safhScroll.alwaysBounceVertical = false
    self.safhScroll.backgroundColor = Colors.page_background
    let screenBounds = UIScreen.mainScreen().bounds
    
    //self.setNeedsStatusBarAppearanceUpdate()
    print(NSStringFromCGRect(screenBounds))
    
    self.initImage(screenBounds.size)
    self.setupViewGesture()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
//    self.parentViewController?.view.makeToast("Safha \(self.page)")
    self.delegate.safhaViewController(self, didAppearForPage: page)
  }
  
  func invertImage(originalImage: UIImage) -> UIImage {
    
    UIGraphicsBeginImageContext(originalImage.size)
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), CGBlendMode.Copy) //UIGraphicsGetCurrentContext(), kCGBlendModeCopy)
    
    let imageRect: CGRect = CGRectMake(0, 0, originalImage.size.width, originalImage.size.height)
    originalImage.drawInRect(imageRect)
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), .Difference)
    // translate/flip the graphics context (for transforming from CG* coords to UI* coords
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, originalImage.size.height)
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0)
    //mask the image
    CGContextClipToMask(UIGraphicsGetCurrentContext(), imageRect, originalImage.CGImage)
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), UIColor.whiteColor().CGColor)
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, originalImage.size.width, originalImage.size.height))
    let returnImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return returnImage
  }
  
  
  func imageViewSizeFromOrientation(imageSize:CGSize, screenSize:CGSize) -> CGSize {
    switch UIDevice.currentDevice().orientation{
    case .Portrait, .PortraitUpsideDown:
      return CGSizeMake(imageSize.width/2, screenSize.height)
    case .LandscapeLeft, .LandscapeRight:
      return CGSizeMake(imageSize.width/2, (imageSize.height/2))
    default:
      return CGSizeMake(imageSize.width/2, screenSize.height)
    }
  }
  
  func initImage(size: CGSize) -> Void {
    var image : UIImage!
    
    let width  = Int(size.width * 2)
    image = UIImage(named: "\(self.page)-\(width).png")
    
    print(NSStringFromCGSize(size))
    print(NSStringFromCGSize(image.size))
    
    
    let viewSize = self.imageViewSizeFromOrientation(image.size, screenSize: size)
    
//    image = self.invertImage(image)
    
//    if (imageView != nil) {
//      imageView.frame = CGRectMake(0, 0, (image.size.width/2), (image.size.height/2))
//    }
//    else{
//      imageView = UIImageView(frame: CGRectMake(0, 0, size.width, 667))
      imageView = UIImageView(frame: CGRectMake(0, 0, viewSize.width, viewSize.height))
//      imageView = UIImageView(frame: CGRectMake(0, 0, (image.size.width/2), (image.size.height/2)))
//    }
    
    self.imageView.backgroundColor = Colors.page_background
    //self.imageView.bounds = CGRectInset(self.imageView.frame, 0, 20)

//    self.imageView.backgroundColor = UIColor.blackColor()
    imageView.image = image
    imageView.contentMode = .ScaleAspectFit
//    imageView.contentMode = .ScaleAspectFill
//      imageView.contentMode = .ScaleToFill
//    imageView.contentMode = .Redraw
    imageView.setNeedsLayout()
    safhScroll.addSubview(imageView)
//    self.safhScroll.contentSize = CGSizeMake(size.width, image.size.height/2)
    self.safhScroll.contentSize = viewSize
    //    self.safhScroll.contentMode = .ScaleAspectFit
    let border = borderForPage(imageView.frame)
    self.safhScroll.addSubview(border)
    
    let bookShadow = bookShadowView(imageView.frame)
    self.safhScroll.addSubview(bookShadow)
    
  }
  
  func borderForPage(mainViewFrame:CGRect) -> UIView {
    let borderWidth : CGFloat = 5
    let image = self.page % 2 == 0 ? R.image.bkg_safha_border_left() : R.image.bkg_safha_border_right()
    let x = self.page % 2 == 0 ? 0 : (mainViewFrame.width - borderWidth)
//    let view = UIImageView(frame: CGRectMake(x, 0, (image?.size.width)!, mainViewFrame.height))
    let view = UIImageView(frame: CGRectMake(x, 0, borderWidth, mainViewFrame.height))
    view.image = image?.tintPhoto(Colors.page_background)

    return view
  }
  
  func bookShadowView(mainViewFrame:CGRect) -> UIView {
//    let x = self.page % 2 == 1 ? 0 : (mainViewFrame.width - (mainViewFrame.width/6))
//    let view = GradientView(frame: CGRectMake(x, 0, (mainViewFrame.width/6), mainViewFrame.height))
//    
    return GradientView.bookShadowForPage(self.page, inImageView: mainViewFrame)
  }
  
  func didTouchView(tapGesture: UITapGestureRecognizer) -> Void {
    self.delegate.toggleMenusSafhaViewController(self)
  }
  
  
  func setupViewGesture() -> Void {
    //  var gestureRecognizer = [[UILongPressGestureRecognizer alloc] init];
    
    let touchUpGesture = UITapGestureRecognizer()
    touchUpGesture.delegate = self
    
    //    UITapGestureRecognizer* gestureRecognizer = [[UITapGestureRecognizer alloc] init];
    //    [gestureRecognizer setNumberOfTouchesRequired:1];
    //    [gestureRecognizer setNumberOfTapsRequired:1];
    
    self.view.userInteractionEnabled = true
    
    touchUpGesture.addTarget(self, action: #selector(SafhaViewController.didTouchView(_:)))
    self.view.addGestureRecognizer(touchUpGesture)
    
    
    //  [gestureRecognizer addTarget:self action:@selector(safhaLongPressed:)];
    //  gestureRecognizer.delegate = self;
    //  //    [gestureRecognizer setNumberOfTouchesRequired:1];
    //  //        [gestureRecognizer setMinimumPressDuration:0.2];
    //  [safhaImageView addGestureRecognizer:gestureRecognizer];
  }
  
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    print(UIDevice.currentDevice().orientation)
    self.initImage(size)
  }
  
  //  override func prefersStatusBarHidden() -> Bool {
  //    return true
  //  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
