//
//  Constants.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-02.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import Foundation
import UIKit


struct Global {
  
}

struct Settings {
  static let PageOverflow = "com.quran.ios.settings.page_overflow"
}

struct Config {
  static let baseURL = NSURL(string: "http://www.quran.com/")!
}

struct Colors {
//  static let accentColor = UIColor(red: 178/255, green: 223/255, blue: 219/255, alpha: 1.0) /* #b2dfdb */
  static let accentColorDark = UIColor(red: 178/255, green: 223/255, blue: 219/255, alpha: 137/255) /* #b2dfdb */
  static let juzHeaderInitial = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0) /* #555555 */
  static let headerBackgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0) //#212121
  static let suraCellBackground = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1.0) /* #303030 */
  
  
  static let accentColor = UIColor(argbHex: "#ffb2dfdb" )
  static let accentDarkColor = UIColor(argbHex: "#89b2dfdb" )// "@color/color_control_normal"
  static let controlActivatedColor = UIColor(argbHex: "#ffb2dfdb")//"@color/accent_color")
  static let controlNormalColor = UIColor(argbHex: "#89b2dfdb")
  static let page_background = UIColor(argbHex: "#FFF4CB")
  static let header_background = UIColor(argbHex: "#ff424242")
  static let ripple_dark = UIColor(argbHex: "#33ffffff")
  static let header_text_color = UIColor(argbHex: "#7fffffff") //"@color/sura_number_color")
  static let title_color = UIColor(argbHex: "#ffffffff")
  static let sura_number_color = UIColor(argbHex: "#7fffffff")
  static let sura_details_color = UIColor(argbHex: "#b2ffffff")
  static let transparent_actionbar_color = UIColor(argbHex: "#AA000000")
  static let panel_background_color = UIColor(argbHex: "#ff424242")
  static let translation_hdr_color = UIColor(argbHex: "#ff649ab8")
  static let translation_sura_header = UIColor(argbHex: "#ff649ab8")
  static let overlay_text_color = UIColor(argbHex: "#ff888888")
  static let selection_highlight = UIColor(argbHex: "#404694A6")
  static let audio_highlight = UIColor(argbHex: "#4046A646")
  static let note_highlight = UIColor(argbHex: "#40EBEB21")
  static let bookmark_highlight = UIColor(argbHex: "#40A4A4A4")
  static let translation_highlight = UIColor(argbHex: "#ff33b5e5")
  static let toolbar_background = UIColor(argbHex: "#ed2b5836")
  static let toolbar_item_pressed = UIColor(argbHex: "#552bff36")
  static let indicator_color = UIColor(argbHex: "#ffb2dfdb") //"@color/accent_color")
  static let panel_label = UIColor(argbHex: "#ffb2dfdb")//"@color/accent_color")
  static let notification_color = UIColor(argbHex: "#ff112e44")
  static let audio_notification_color = UIColor(argbHex: "#ff556f79") //"@color/download_button_background")
  static let audio_notification_background_color = UIColor(argbHex: "#ffd8d8d8")
  static let ayah_bookmark_color = UIColor(argbHex: "#ff81c784")
  static let download_button_background = UIColor(argbHex: "#ff556f79")
  static let snackbar_background_color = UIColor(argbHex: "#ff556f79") //"@color/download_button_background")
  
}



