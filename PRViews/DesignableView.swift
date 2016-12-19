//
//  DesignableView.swift
//  ModalTest
//
//  Created by Pedro on 19-12-16.
//  Copyright © 2016 Rothen. All rights reserved.
//

import UIKit

public class DesignableView: UIView {
    var view: UIView!
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
    }
    
    func xibSetup(nibName: String) {
        self.view = loadViewFromNib(nibName)
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        view.clipsToBounds = true
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
}
