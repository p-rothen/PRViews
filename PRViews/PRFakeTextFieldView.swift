//
//  HeaderView.swift
//  Geyser
//
//  Created by Pedro on 05-04-16.
//  Copyright © 2016 IQS. All rights reserved.
//

import UIKit
//import CZPicker

public protocol PRFakeTextFieldViewDelegate{
    func didTapView()
}

@IBDesignable public class PRFakeTextFieldView: UIView {
    @IBOutlet weak var textFieldNationality: UITextField!
    @IBOutlet weak var viewArrow: UIView!
    
    var view: UIView!
    
    var nibName:String = "PRFakeTextFieldView"
    
    public init(frame: CGRect, nibName: String) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        self.xibSetup()
    }
    
    func xibSetup() {
        self.view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        //NSBundle.mainBundle()
        let bundle = NSBundle.mainBundle()
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
}

