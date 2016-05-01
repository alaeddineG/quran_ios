//
//  SafhaViewController.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-04.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Crashlytics

class SurahsViewController: UITableViewController, IndicatorInfoProvider, MosshafViewControllerDelegate {
  
  var juzList : [JuzSection]!
  var initialJuzHadearColor : UIColor!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Safha"
    
    self.setupTableViewAppearance()
    // Do any additional setup after loading the view.
    self.buildSurahList()
//    self.tableView.separatorStyle = 
    
  
    
  }
  
  
  func setupTableViewAppearance() -> Void {
    let backView = UIView(frame: self.tableView.bounds)
    backView.backgroundColor = Colors.headerBackgroundColor
    self.tableView.backgroundView = backView
    self.view.backgroundColor = Colors.headerBackgroundColor
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    Crashlytics.sharedInstance().recordError(NSError(domain: "test", code: 111, userInfo: nil))
    CLSLogv("Log awesomeness %d %d %@", getVaList([1, 2, "three"]))
    print("SurahsViewController willAppear")
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.surasCountAtSection(section)
  }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let juz = self.juzAtSection(section)
    return juz.juzName
  }
  
  func cellSelectedView(rect: CGRect) -> UIView {
    let view = UIView(frame: rect)
    view.backgroundColor = UIColor.darkGrayColor()
    return view
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.suraCell.identifier) as! SuraTableViewCell
    let currentSura = self.suraForRowAtIndexPath(indexPath)
    cell.suraNameLabel.text = "Surat \(currentSura.surahName)"
    cell.selectedBackgroundView = self.cellSelectedView(cell.bounds)
    let makiMadan = currentSura.isMakki ? "Makki" : "Madani"
    let surahDescription = " \(makiMadan) - \(currentSura.ayahCount) verses"
    cell.suraDescriptionLabel.text = surahDescription
    cell.suraNumberLabel.text = "\(currentSura.surahIndex + 1)"
    cell.startPageLabel.text = "\(currentSura.startPage)"
    cell.backgroundColor = Colors.suraCellBackground
    print(cell.suraNumberLabel.text)
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 60
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    print("SurahsViewController didReceiveMemoryWarning")
  }

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return BaseQuranData.JuzCount
  }
  
  override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let juzView = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.juzCell.identifier) as! JuzTableViewCell
    let juz = self.juzAtSection(section)
    
    
    juzView.juzButton.setTitle(juz.juzName, forState: .Normal)
    juzView.startPageLabel.text = "\(juz.startPage)"
    juzView.juzButton.tag = section
    self.initialJuzHadearColor = juzView.juzButton.backgroundColor
    
//    headerView.backgroundColor = Colors.juzHeaderInitial
    juzView.juzButton.addTarget(self, action: #selector(SurahsViewController.didSelectJuz(_:)), forControlEvents: .TouchUpInside)
    juzView.juzButton.addTarget(self, action: #selector(SurahsViewController.didHighlightJuz(_:)), forControlEvents: .TouchDown)
  
    return juzView
  }
  
  func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "SURAHS")
  }
  
  func didHighlightJuz(sender: UIButton!) -> Void {
    sender.backgroundColor = UIColor.darkGrayColor()
  }
  
  func didSelectJuz(sender: UIButton!) {
    sender.backgroundColor = self.initialJuzHadearColor
    let juz = self.juzAtSection(sender.tag)
    self.performSegueWithIdentifier(R.segue.surahsViewController.presentMoshaf, sender: juz)
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
    let selectecSurah = self.suraForRowAtIndexPath(indexPath)
    self.performSegueWithIdentifier(R.segue.surahsViewController.presentMoshaf, sender: selectecSurah)
    
  }


   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    switch segue.identifier {
    case R.segue.surahsViewController.presentMoshaf.identifier?:
      let moshaf = segue.destinationViewController as! MosshafViewController
      moshaf.mosshafDelegate = self
      if sender is SurahRow{
        let sura = sender as! SurahRow
        moshaf.currentPage = sura.startPage
      }
      else if (sender is JuzSection) {
        let juz = sender as! JuzSection
        moshaf.currentPage = juz.startPage
      }
      break
    default: break
    }
   }
 
  
  func buildSurahList() -> Void {
    self.juzList = []
    
    for i in 0..<BaseQuranData.JuzCount {
      let juzNumber = i + 1
      let juzName = "Juz' \(juzNumber)"
      let currentJuzStartPage = BaseQuranData.JuzPageStart[i]
      let juz = JuzSection(juzName:juzName , juzIndex: i, startPage: currentJuzStartPage, juzNumber: juzNumber)
      
      let nextJuzStartPage = (juzNumber == BaseQuranData.JuzCount) ? BaseQuranData.NumberOfPages + 1 : BaseQuranData.JuzPageStart[i + 1]
      
      var juzSurahList : [Int] = []
      for j in 0..<BaseQuranData.SuraCount {
        let currentSuraStartPage = BaseQuranData.SuraPageStart[j]
        if  currentSuraStartPage >= currentJuzStartPage  && currentSuraStartPage < nextJuzStartPage {
          juzSurahList.append(j)
        }
      }
      
      let juzSuraRows = juzSurahList.map({ (suraIndex) -> SurahRow in
          return SurahRow(surahName: BaseQuranData.SurasName[suraIndex], surahIndex: suraIndex, ayahCount: BaseQuranData.SuraAyahCount[suraIndex], startPage: BaseQuranData.SuraPageStart[suraIndex], isMakki: BaseQuranData.SuraIsMakki[suraIndex])
      })
      
      juz.surahList = juzSuraRows
      juzList.append(juz)
    }
    
    print("Done Building")
  }
  
  
  func suraForRowAtIndexPath(indexPath: NSIndexPath) -> SurahRow {
    let juzAtSection = self.juzAtSection(indexPath.section)
    let surra = juzAtSection.surahList[indexPath.row]
    
    return surra
  }
  
  func juzAtSection(section: Int) -> JuzSection {
    let juz = self.juzList[section]
    return juz
  }
  
  func surasCountAtSection(section: Int) -> Int {
    let juzAtSection = self.juzAtSection(section)
    let suraCount = juzAtSection.surahList.count
    
    return suraCount
  }
  
  
  func didCloseMosshafViewController(mosshafViewController: MosshafViewController) {
    self.dismissViewControllerAnimated(true) {
      print("dismissViewControllerAnimated didCloseMosshafViewController")
    }
    
  }
  
}
