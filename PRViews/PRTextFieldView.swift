//
//  PRTextFieldView.swift
//  Pods
//
//  Created by Pedro on 16-12-16.
//
//

import UIKit

public protocol PRTextFieldViewDelegate{
    func didTapView()
}

@IBDesignable public class PRTextFieldView: UIView {
    @IBOutlet weak var textFieldNationality: UITextField!
    @IBOutlet weak var imageViewArrow: UIImageView!
    public var tapHanler: (Void -> Void)?
    
    var view: UIView!
    var nibName:String = "PRTextFieldView"
    
    
    @IBInspectable var textFieldBackground: UIColor? {
        didSet {
            self.textFieldNationality.layer.borderColor = textFieldBackground?.CGColor
            self.textFieldNationality.backgroundColor = textFieldBackground
        }
    }
    
    @IBInspectable var fakePlaceholder: String? {
        didSet {
            self.textFieldNationality.text = fakePlaceholder
        }
    }
    
    @IBInspectable var placeholderText: String? {
        didSet {
            self.textFieldNationality.userInteractionEnabled = true
            self.textFieldNationality.placeholder = placeholderText
        }
    }
    
    @IBInspectable var hiddenArrow:Bool = true {
        didSet {
            self.imageViewArrow.hidden = hiddenArrow
        }
    }
    
    override public init(frame: CGRect) {
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
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapView)))
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func didTapView() {
        self.tapHanler?()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
}
