//
//  FMDatabase+Helper.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-03.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import Foundation
import FMDB

extension FMDatabase {
  
  func excuteQueryInDb(sqlQuery: String, db : FMDatabase,
                       success: (AnyObject) -> Void,
                       fail: (NSError!) -> Void) -> Void {
    if !db.open() {
      fail(nil)
    }
    defer { db.close() }
    
    
    let data = NSMutableArray()
    do{
      let result =  try db.executeQuery(sqlQuery, values: nil)
      result.iterate { (row: [String : AnyObject!]) in
        data.addObject(row)
      }
    }
    catch {
      fail(nil)
    }
  }
}