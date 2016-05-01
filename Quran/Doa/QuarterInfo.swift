//
//  QuarterInfo.swift
//  Quran
//
//  Created by Alaeddine Gallas on 2016-04-23.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

class QuarterInfo: NSObject {
    var sura : Int
    var aya : Int
    
    init(sura: Int, aya: Int) {
        self.aya = aya
        self.sura = sura
    }
}
