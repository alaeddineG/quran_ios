//
//  MosshafActionBar.swift
//  iOSQuran
//
//  Created by Alaeddine Gallas on 2016-04-10.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit


protocol MosshafActionBarDelegate: NSObjectProtocol {
    func didPushBackMosshafBar(mosshafActionBar: MosshafActionBar);
}

public class MosshafActionBar: UIView {
    
    var delegate : MosshafActionBarDelegate!;
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var suraNameLabel: UILabel!
    @IBOutlet weak var suraDescriptionLabel: UILabel!
    @IBAction func didPushBackButton(sender: AnyObject) {
        
        
        //      if( self.delegate ! nil && self.delegate.respondsToSelector(#selector(MosshafActionBarDelegate.didPushBackMosshafBar(_:) )) {
        //
        //      }
        
        
        self.delegate!.didPushBackMosshafBar(self)
    }
     
    public func updateBarData(suraName: String, suraDescription: String) -> Void {
        self.suraNameLabel.text = suraName
        self.suraDescriptionLabel.text = suraDescription
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
