//
//  QuranRepository.swift
//  Quran
//
//  Created by Alaeddine Gallas on 2016-04-20.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit
import FMDB


class QuranRepository: NSObject {
    var dbFilePath : String!
    
    init(dataBaseFilePath: String) {
        super.init()
        self.dbFilePath = dataBaseFilePath
    }
}
