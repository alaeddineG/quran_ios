//
//  JuzViewController.swift
//  Quran
//
//  Created by Alaeddine Gallas on 2016-04-20.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class JuzViewController: UITableViewController, IndicatorInfoProvider {
  
  var quratersPrefix : NSMutableArray!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.text()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//    return BaseQuranData.JuzCount
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.quratersPrefix.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .Default, reuseIdentifier: "id")
    
    
    let str = self.quratersPrefix[indexPath.row]
    cell.textLabel?.text = str as? String
    cell.textLabel?.semanticContentAttribute = UISemanticContentAttribute.ForceRightToLeft
    cell.textLabel?.font = UIFont(name: "KFGQPC Uthmanic Script HAFS", size: 22)
    
    
    return cell
  }
  
  
  
  
  func text() -> Void {
//    let path = NSBundle.mainBundle().pathForResource("QuartersPrefix", ofType: "plist")!
    
//    let array = NSMutableArray(contentsOfFile: path)
    
    let array = NSMutableArray(contentsOfURL: R.file.quartersPrefixPlist()!)
    
    self.quratersPrefix = array
//    let dico  = NSDictionary(contentsOfURL: R.file.quartersPrefixPlist()!)
//    print("\(dico)")
//    print("\(array)")
//    var inString = ""
//    do {
//      inString = try String(contentsOfFile:path)
//    } catch let error as NSError {
//      print("Failed reading from URL: \(path), Error: " + error.localizedDescription)
//    }
//    
//    let cardNum = array![8]
//    let s = cardNum.cStringUsingEncoding(NSUTF8StringEncoding)
//    print(s)
//    //    let array = NSDictionary(contentsOfFile: path)
//    
//    print("\(inString)")
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
   if editingStyle == .Delete {
   // Delete the row from the data source
   tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
   } else if editingStyle == .Insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
  
  func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "JUZ'")
  }
  
}
