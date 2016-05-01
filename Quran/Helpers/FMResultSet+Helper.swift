//
//  FMResultSet+Helper.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-03.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import Foundation
import FMDB

extension FMResultSet{
  
  func iterate(iterator:([String:AnyObject!]) -> Void) -> Void {
    while self.next() {
      var row = Dictionary<String,AnyObject!>()
      for i in 0...self.columnCount() {
        let currentColumn = self.columnNameForIndex(i)
        row[currentColumn] = self.valueForKey(currentColumn)
      }
      iterator(row)
    }
  }
  
}
