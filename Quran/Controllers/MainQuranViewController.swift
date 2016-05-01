//
//  MainQuranViewController.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-04.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import RxSwift.Swift

class MainQuranViewController: ButtonBarPagerTabStripViewController{
    
    let graySpotifyColor = Colors.accentColor
    let darkGraySpotifyColor = Colors.accentDarkColor
    
    let disposeBag = DisposeBag()
    @IBOutlet weak var moreBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        //Warning : Should always be called before super.viewDidLoad()
        self.setupTapStrip()
        super.viewDidLoad()
        self.setupBarItemsSubscription()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func setupTapStrip() -> Void {
        settings.style.buttonBarBackgroundColor = Colors.headerBackgroundColor;
        settings.style.buttonBarItemBackgroundColor = Colors.headerBackgroundColor
        settings.style.selectedBarBackgroundColor = Colors.accentColor
        settings.style.buttonBarItemFont = UIFont(name: "HelveticaNeue-Light", size:14) ?? UIFont.systemFontOfSize(14)
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .blackColor()
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = Colors.accentColorDark
            newCell?.label.textColor = Colors.accentColor
        }
    }
    
    func setupBarItemsSubscription() -> Void {
        if let moreButton = self.moreBarButtonItem {
            moreButton.rx_tap.subscribeNext({
                self.presentMoreMenu(over: moreButton)
            }).addDisposableTo(disposeBag)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewControllersForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [R.storyboard.main.surahViewController()!, JuzViewController(), BookmarksViewController()]
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    func presentMoreMenu(over barButtonItem: UIBarButtonItem) {
        if let menu = R.storyboard.main.moreMenuViewController(){
            menu.modalPresentationStyle = .Popover
            menu.preferredContentSize = CGSizeMake(200, 174);
            
            
            menu.menuSelectorObserver.subscribeNext({ selectedMainMoreMenuItem in
                print(selectedMainMoreMenuItem)
                self.dismissViewControllerAnimated(true, completion: nil)
            }).addDisposableTo(self.disposeBag)
            
//            menu.menuItemSelectex.subscribeNext({ selectedItem  in
//                print(selectedItem)
//                self.dismissViewControllerAnimated(true, completion: nil)
//            }).addDisposableTo(self.disposeBag)
            
            if let pop = menu.popoverPresentationController {
                pop.delegate = menu
                pop.backgroundColor = menu.view.backgroundColor
                pop.barButtonItem = barButtonItem
                pop.permittedArrowDirections = .Up
                self.presentViewController(menu, animated: true) {
                    print("Done")
                }
            }
        }
    }
    
}
