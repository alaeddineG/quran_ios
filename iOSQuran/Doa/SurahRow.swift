//
//  SurahRow.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-06.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

class SurahRow: NSObject {
    var surahName : String!
    var surahIndex : Int!
    var ayahCount : Int!
    var startPage : Int!
    var isMakki : Bool
    
    init(surahName: String, surahIndex: Int, ayahCount: Int, startPage: Int, isMakki: Bool) {
        self.surahName = surahName
        self.surahIndex = surahIndex
        self.ayahCount = ayahCount
        self.startPage = startPage
        self.isMakki = isMakki
    }    
}
