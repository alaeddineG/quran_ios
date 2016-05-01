//
//  JuzSection.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-07.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

class JuzSection: NSObject {
    
    var juzName : String!
    var juzIndex : Int!
    var startPage : Int!
    var juzNumber : Int!
    var surahList : [SurahRow]!
    
    init(juzName:String, juzIndex: Int,startPage: Int, juzNumber: Int) {
        self.juzName = juzName
        self.juzIndex = juzIndex
        self.startPage = startPage
        self.juzNumber = juzNumber
    }
    
}
