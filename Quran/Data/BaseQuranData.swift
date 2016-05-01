//
//  BaseQuranData.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-02.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import Foundation


struct BaseQuranData {
  static let SuraCount = 114
  static let JuzCount = 30
  static let NumberOfPages = 604
  static let AyaMin = 1;
  static let AyaMax = 286;
  
  static let SuraPageStart : [Int] = [1, 2, 50, 77, 106, 128, 151, 177, 187, 208, 221, 235, 249, 255, 262,
                                      267, 282, 293, 305, 312, 322, 332, 342, 350, 359, 367, 377, 385, 396,
                                      404, 411, 415, 418, 428, 434, 440, 446, 453, 458, 467, 477, 483, 489,
                                      496, 499, 502, 507, 511, 515, 518, 520, 523, 526, 528, 531, 534, 537,
                                      542, 545, 549, 551, 553, 554, 556, 558, 560, 562, 564, 566, 568, 570,
                                      572, 574, 575, 577, 578, 580, 582, 583, 585, 586, 587, 587, 589, 590,
                                      591, 591, 592, 593, 594, 595, 595, 596, 596, 597, 597, 598, 598, 599,
                                      599, 600, 600, 601, 601, 601, 602, 602, 602, 603, 603, 603, 604, 604,
                                      604]
  
  static let PageSuraStart : [Int] = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                                      2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                                      2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
                                      3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
                                      4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
                                      5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
                                      6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
                                      7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9,
                                      9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10,
                                      10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
                                      11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 13,
                                      13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 16,
                                      16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17,
                                      17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
                                      19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21,
                                      21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22,
                                      22, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24,
                                      24, 25, 25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,
                                      27, 27, 27, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 28, 28, 28,
                                      28, 28, 29, 29, 29, 29, 29, 29, 29, 29, 30, 30, 30, 30, 30, 30, 31, 31,
                                      31, 31, 32, 32, 32, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 34, 34, 34,
                                      34, 34, 34, 34, 35, 35, 35, 35, 35, 35, 36, 36, 36, 36, 36, 37, 37, 37,
                                      37, 37, 37, 37, 38, 38, 38, 38, 38, 38, 39, 39, 39, 39, 39, 39, 39, 39,
                                      39, 40, 40, 40, 40, 40, 40, 40, 40, 40, 41, 41, 41, 41, 41, 41, 42, 42,
                                      42, 42, 42, 42, 42, 43, 43, 43, 43, 43, 43, 44, 44, 44, 45, 45, 45, 45,
                                      46, 46, 46, 46, 47, 47, 47, 47, 48, 48, 48, 48, 48, 49, 49, 50, 50, 50,
                                      51, 51, 51, 52, 52, 53, 53, 53, 54, 54, 54, 55, 55, 55, 56, 56, 56, 57,
                                      57, 57, 57, 58, 58, 58, 58, 59, 59, 59, 60, 60, 60, 61, 62, 62, 63, 64,
                                      64, 65, 65, 66, 66, 67, 67, 67, 68, 68, 69, 69, 70, 70, 71, 72, 72, 73,
                                      73, 74, 74, 75, 76, 76, 77, 78, 78, 79, 80, 81, 82, 83, 83, 85, 86, 87,
                                      89, 89, 91, 92, 95, 97, 98, 100, 103, 106, 109, 112]
  
  static let JuzPageStart : [Int] = [1, 22, 42, 62, 82, 102, 121, 142, 162, 182,
                                     201, 222, 242, 262, 282, 302, 322, 342, 362, 382,
                                     402, 422, 442, 462, 482, 502, 522, 542, 562, 582]
  
  static let SuraAyahCount : [Int] = [
    7, 286, 200, 176, 120, 165, 206, 75, 129, 109, 123, 111,
    43, 52, 99, 128, 111, 110, 98, 135, 112, 78, 118, 64, 77,
    227, 93, 88, 69, 60, 34, 30, 73, 54, 45, 83, 182, 88, 75,
    85, 54, 53, 89, 59, 37, 35, 38, 29, 18, 45, 60, 49, 62, 55,
    78, 96, 29, 22, 24, 13, 14, 11, 11, 18, 12, 12, 30, 52, 52,
    44, 28, 28, 20, 56, 40, 31, 50, 40, 46, 42, 29, 19, 36, 25,
    22, 17, 19, 26, 30, 20, 15, 21, 11, 8, 8, 19, 5, 8, 8, 11,
    11, 8, 3, 9, 5, 4, 7, 3, 6, 3, 5, 4, 5, 6]
  
  static let SuraIsMakki : [Bool] = [
    // 1 - 10
    true, false, false, false, false, true, true, false, false, true,
    // 11 - 20
    true, true, false, true, true, true, true, true, true, true,
    // 21 - 30
    true, false, true, false, true, true, true, true, true, true,
    // 31 - 40
    true, true, false, true, true, true, true, true, true, true,
    // 41 - 50
    true, true, true, true, true, true, false, false, false, true,
    // 51 - 60
    true, true, true, true, false, true, false, false, false, false,
    // 61 - 70
    false, false, false, false, false, false, true, true, true, true,
    // 71 - 80
    true, true, true, true, true, false, true, true, true, true,
    // 81 - 90
    true, true, true, true, true, true, true, true, true, true,
    // 91 - 100
    true, true, true, true, true, true, true, false, false, true,
    // 101 - 110
    true, true, true, true, true, true, true, true, true, false,
    // 111 - 114
    true, true, true, true]
  
  
  
  private static var quarters : NSMutableArray?
  private static var quartersInfo : [[QuarterInfo]]?
  static var Quarters : [[QuarterInfo]] {
    get{
      var token: dispatch_once_t = 0
      dispatch_once(&token) {
        if let url : NSURL = R.file.quartersPlist(){
          quarters = NSMutableArray(contentsOfURL: url)
          quartersInfo = quarters?.map({ (juz) -> Array<QuarterInfo> in
            let juzzArray = juz as! NSArray
            let quartersArray = juzzArray.map({ (quarter) -> QuarterInfo in
              let sura = quarter[0] as! Int
              let aya = quarter[1] as! Int
              return QuarterInfo(sura: sura, aya: aya)
            })
            return quartersArray
          })
        }
      }
      return quartersInfo!
    }
  }
  
  private static var quratersPrefixArray : NSMutableArray?
  private static var quartersPrefix : [String]?
  static var QuartersSuraPrefix : [[QuarterInfo]] {
    get{
      var token: dispatch_once_t = 0
      dispatch_once(&token) {
        if let url : NSURL = R.file.quartersPlist(){
          quarters = NSMutableArray(contentsOfURL: url)
          quartersInfo = quarters?.map({ (juz) -> Array<QuarterInfo> in
            let juzzArray = juz as! NSArray
            let quartersArray = juzzArray.map({ (quarter) -> QuarterInfo in
              let sura = quarter[0] as! Int
              let aya = quarter[1] as! Int
              return QuarterInfo(sura: sura, aya: aya)
            })
            return quartersArray
          })
        }
      }
      return quartersInfo!
    }
  }

  
  static let SurasName : [String] = ["Al-Fatihah",
                                     "Al-Baqarah",
                                     "Aal-E-Imran",
                                     "An-Nisa'",
                                     "Al-Ma'idah",
                                     "Al-An'am",
                                     "Al-A'raf",
                                     "Al-Anfal",
                                     "At-Tawbah",
                                     "Yunus",
                                     "Hud",
                                     "Yusuf",
                                     "Ar-Ra'd",
                                     "Ibrahim",
                                     "Al-Hijr",
                                     "An-Nahl",
                                     "Bani Israel",
                                     "Al-Kahf",
                                     "Maryam",
                                     "Ta-Ha",
                                     "Al-Anbiya'",
                                     "Al-Hajj",
                                     "Al-Mu'minun",
                                     "An-Nur",
                                     "Al-Furqan",
                                     "Ash-Shu'ara",
                                     "An-Naml",
                                     "Al-Qasas",
                                     "Al-Ankabut",
                                     "Ar-Rum",
                                     "Luqman",
                                     "As-Sajdah",
                                     "Al-Ahzab",
                                     "Saba'",
                                     "Fatir",
                                     "Ya-Seen",
                                     "As-Saaffat",
                                     "Sad",
                                     "Az-Zumar",
                                     "Al-Mu'min",
                                     "Ha Meem As-Sajdah",
                                     "Ash-Shura",
                                     "Az-Zukhruf",
                                     "Ad-Dukhan",
                                     "Al-Jathiya",
                                     "Al-Ahqaf",
                                     "Muhammad",
                                     "Al-Fath",
                                     "Al-Hujurat",
                                     "Qaf",
                                     "Adh-Dhariyat",
                                     "At-Tur",
                                     "An-Najm",
                                     "Al-Qamar",
                                     "Ar-Rahman",
                                     "Al-Waqi'ah",
                                     "Al-Hadid",
                                     "Al-Mujadila",
                                     "Al-Hashr",
                                     "Al-Mumtahana",
                                     "As-Saf",
                                     "Al-Jumu'ah",
                                     "Al-Munafiqun",
                                     "At-Taghabun",
                                     "At-Talaq",
                                     "At-Tahrim",
                                     "Al-Mulk",
                                     "Al-Qalam",
                                     "Al-Haqqah",
                                     "Al-Ma'arij",
                                     "Nuh",
                                     "Al-Jinn",
                                     "Al-Muzzammil",
                                     "Al-Muddaththir",
                                     "Al-Qiyamah",
                                     "Ad-Dahr",
                                     "Al-Mursalat",
                                     "An-Naba'",
                                     "An-Nazi'at",
                                     "'Abasa",
                                     "At-Takwir",
                                     "Al-Infitar",
                                     "Al-Mutaffifin",
                                     "Al-Inshiqaq",
                                     "Al-Buruj",
                                     "At-Tariq",
                                     "Al-A'la",
                                     "Al-Ghashiyah",
                                     "Al-Fajr",
                                     "Al-Balad",
                                     "Ash-Shams",
                                     "Al-Layl",
                                     "Ad-Dhuhaa",
                                     "Al-Sharh",
                                     "At-Tin",
                                     "Al-Alaq",
                                     "Al-Qadr",
                                     "Al-Bayyinah",
                                     "Az-Zalzalah",
                                     "Al-Adiyat",
                                     "Al-Qari'ah",
                                     "At-Takathur",
                                     "Al-Asr",
                                     "Al-Humazah",
                                     "Al-Fil",
                                     "Quraysh",
                                     "Al-Ma'un",
                                     "Al-Kawthar",
                                     "Al-Kafirun",
                                     "An-Nasr",
                                     "Al-Lahab",
                                     "Al-Ikhlas",
                                     "Al-Falaq",
                                     "An-Nas"]
  
}