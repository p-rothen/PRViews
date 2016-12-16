//
//  PRTextField.swift
//  Doctor Cloud
//
//  Created by Pedro on 14-12-16.
//  Copyright © 2016 IQS. All rights reserved.
//

import UIKit

public class PRTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8);
    let customBackgroundColor = UIColor(red:0.96, green:0.96, blue:0.98, alpha:1.0)
    
    let customTextColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    
     public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //self.borderStyle = .None
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 3;
        self.layer.borderColor = self.customBackgroundColor.CGColor
        self.backgroundColor = self.customBackgroundColor
        self.textColor = customTextColor
        self.tintColor = customTextColor
        ViewUtils.addLightShadow(self)
        
        NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 50).active = true
    }
    
    public override func textRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }
    
    public override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }
    
     public override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.padding)
    }
}
