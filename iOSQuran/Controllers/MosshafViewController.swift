//
//  MosshafViewController.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-04.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

protocol MosshafViewControllerDelegate {
  func didCloseMosshafViewController(mosshafViewController: MosshafViewController)
}


class MosshafViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, SafhaControllerDelegate, MosshafActionBarDelegate  {
  
  var currentPage : Int!
  var currentShafha : SafhaViewController!
  var actionBar : MosshafActionBar!
  var mosshafDelegate : MosshafViewControllerDelegate!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    self.dataSource = self

    
    
    
//    if let navigationBar = navigationController?.navigationBar {
//      navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//      navigationBar.shadowImage = UIImage()
//      navigationBar.translucent = true
//      navigationController?.view.backgroundColor = .clearColor()
//      navigationBar.alpha = 0.4
//    }

    
//    self.navigationController?.view.backgroundColor = UIColor.clearColor()
    
    self.setupActionBar()
    
    currentShafha = R.storyboard.main.safhaViewController()
    currentShafha.page = currentPage
    currentShafha.delegate = self
    
    self.transitionStyle
    
    self.setViewControllers([currentShafha], direction: .Reverse, animated: true) { (done) in
      print("done")
    }
    
    
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    self.performSelector(#selector(MosshafViewController.toggleActionBar), withObject: nil, afterDelay: 2)
  }
  
  
  func transationStyleForPage() -> UIPageViewControllerTransitionStyle {
    return self.currentPage % 2 == 0 ? .PageCurl : .Scroll
  }
  
  func didPushVolume(notification:NSNotification) -> Void {
    print("didPushVolume")
  }

  func setupActionBar() -> Void {

    self.actionBar = R.nib.mosshafActionBar.firstView(owner: self)
    self.actionBar.delegate = self

    self.actionBar.y = 0
    self.actionBar.width = self.view.width
    self.needToUpdateActionBarInformation()

    self.view.addSubview(self.actionBar)
    
    let contraint = NSLayoutConstraint(item: self.actionBar, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1, constant: 1)
    self.view.addConstraint(contraint)
    
  }
  
  func showActionBar() -> Void {
    UIView.animateWithDuration(0.3, animations: {
      self.actionBar.y = 0
    }) { (done) in
      print("showActionBar animation done")
      self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  func hideActionBar() -> Void {
    UIView.animateWithDuration(0.3, animations: {
      self.setNeedsStatusBarAppearanceUpdate()
      self.actionBar.y = -self.actionBar.height
    }) { (done) in
      print("hideActionBar animation done")
      self.setNeedsStatusBarAppearanceUpdate()
    }
  }
  
  func toggleActionBar() -> Void {
    if( self.actionBar.y < 0) {
      self.showActionBar()
    }
    else{
      self.hideActionBar()
    }
  }
  

  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return self.actionBar.y < 0
//    return false
  }
  
  override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
    return .Fade
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    let previousSafha = viewController as! SafhaViewController
    
    if(previousSafha.page == BaseQuranData.NumberOfPages){
      return nil
    }
    
    var nextPage = previousSafha.page!
    nextPage += 1
    
    let safha = R.storyboard.main.safhaViewController()
    
    safha?.page = nextPage
    safha?.delegate = self
    currentPage = safha?.page
    
    
    
    return safha
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    let previousSafha = viewController as! SafhaViewController
    
    if(previousSafha.page == 1){
      return nil
    }
    
    var previousPage = previousSafha.page!
    previousPage -= 1
    
    let safha = R.storyboard.main.safhaViewController()
    safha?.page = previousPage
    safha?.delegate = self
    currentPage = safha?.page
    return safha
  }
  
  
  func needToHideMenusSafhaViewController(safhaViewController: SafhaViewController) {
    
  }
  
  func needToShowMenusSafhaViewController(safhaViewController: SafhaViewController) {
    
  }
  
  func safhaViewController(safhaViewController: SafhaViewController, didAppearForPage page: Int) {
    self.needToUpdateActionBarInformation(page)
    self.currentPage = page
  }
  
  func toggleMenusSafhaViewController(safhaViewController: SafhaViewController) {
    self.toggleActionBar()
  }
  
  func didPushBackMosshafBar(mosshafActionBar: MosshafActionBar) {
    print("Mosshaf Controller : didPushBackMosshafBar")
    self.mosshafDelegate.didCloseMosshafViewController(self)
  }
  
  func juzAtPage(page: Int) -> Int {
    for i in BaseQuranData.JuzPageStart {
      if(i == page || i > page) {
        return i
      }
    }
    
    return -1
  }
  
  func infoAtPage(page: Int) -> (suraName: String, suraDescription:String) {
    let index = page - 1
    let suraInPage = BaseQuranData.PageSuraStart[index] - 1
    let suraName = BaseQuranData.SurasName[suraInPage]
    
    let juzInPage = juzAtPage(page)
    
    return ("Surat \(suraName)", "page \(page), Juz' \(juzInPage)")
  }
  
  func needToUpdateActionBarInformation(page: Int) -> Void {
    let pageInfo = infoAtPage(page)
    actionBar.updateBarData(pageInfo.suraName, suraDescription: pageInfo.suraDescription)
  }
  
  func needToUpdateActionBarInformation() -> Void {
    self.needToUpdateActionBarInformation(self.currentPage)
    let pageInfo = infoAtPage(self.currentPage)
//
    actionBar.updateBarData(pageInfo.suraName, suraDescription: pageInfo.suraDescription)
  }
  

  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
