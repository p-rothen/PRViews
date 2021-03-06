//
//  RoundedButton.swift
//  Doctor Cloud
//
//  Created by Pedro on 14-12-16.
//  Copyright © 2016 IQS. All rights reserved.
//

import UIKit

public class RoundedButton : UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.layer.cornerRadius = 3
        //Default font
        if let fontName = self.titleLabel?.font.fontName where fontName == ".SFUIText" {
            self.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
        }
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowRadius = 1;
        self.layer.shadowColor = UIColor.blackColor().CGColor;
        self.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        self.layer.masksToBounds = false
    }
}
