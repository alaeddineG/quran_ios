//
//  MoreMenuViewController.swift
//  Quran
//
//  Created by Alaeddine Gallas on 2016-04-18.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit
import RxSwift.Swift
import RxCocoa.Swift

public enum MainMoreMenuItem {
    case None
    case Jump
    case Settings
    case Help
    case AboutUs
}

public class MoreMenuViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    var selectedIndex : Variable<MainMoreMenuItem> = Variable(.None)
    let disposeBag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public var menuSelectorObserver: Observable<MainMoreMenuItem> {
        return Observable<MainMoreMenuItem>.create({ observer -> Disposable in
            _ = self.tableView.rx_itemSelected.map { indexPath -> MainMoreMenuItem in
                return self.indexPathToMenuItem(indexPath: indexPath)
            }.subscribeNext({ selected in
                observer.onNext(selected)
                observer.onCompleted()
            })
            return NopDisposable.instance
        })
    }
    
    public var menuItemSelectex: ControlEvent<MainMoreMenuItem> {
        let source = self.tableView.rx_itemSelected.map { indexPath -> MainMoreMenuItem in
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            return self.indexPathToMenuItem(indexPath: indexPath)
        }
        return ControlEvent(events: source)
    }
    
    func indexPathToMenuItem(indexPath aIndexPath: NSIndexPath) -> MainMoreMenuItem {
        switch aIndexPath.row {
            case 0:
                return .Jump
            case 1:
                return .Settings
            case 2:
                return .Help
            case 3:
                return .AboutUs
            default:
                return .None
        }
    }

    public func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}

