//
//  ViewUtils.swift
//  Doctor Cloud
//
//  Created by Pedro on 14-12-16.
//  Copyright © 2016 IQS. All rights reserved.
//

import UIKit

class ViewUtils {
    static func addLightShadow(view: UIView) {
        view.layer.shadowOpacity = 0.2;
        view.layer.shadowRadius = 1;
        view.layer.shadowColor = UIColor.blackColor().CGColor;
        view.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        view.layer.masksToBounds = false
    }
}
