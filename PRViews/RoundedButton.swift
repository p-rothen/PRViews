//
//  RoundedButton.swift
//  Doctor Cloud
//
//  Created by Pedro on 14-12-16.
//  Copyright © 2016 IQS. All rights reserved.
//

import UIKit

public class RoundedButton : UIButton {
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 3
        
        self.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
        
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowRadius = 1;
        self.layer.shadowColor = UIColor.blackColor().CGColor;
        self.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        self.layer.masksToBounds = false
    }
}
