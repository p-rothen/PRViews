//
//  HeaderView.swift
//
//  Created by Pedro on 05-04-16.
//

import UIKit
import CZPicker

public protocol PRPickerViewDelegate{
    func didTapView()
}

@IBDesignable public class PRPickerView: UIView, CZPickerViewDelegate, CZPickerViewDataSource {
    var view:UIView!
    var nibName:String = "PRPickerView"
    var nationalities = ["Chilena", "Peruana", "Colombiana"]
    public var delegate:PRPickerViewDelegate?
    @IBOutlet weak var textFieldNationality: UITextField!
    @IBOutlet weak var viewArrow: UIView!
    
    @IBInspectable var arrowBackground: UIColor? {
        didSet {
            self.viewArrow.backgroundColor = arrowBackground
        }
    }
    
    @IBInspectable var textFieldBackground: UIColor? {
        didSet {
            self.textFieldNationality.layer.borderColor = textFieldBackground?.CGColor
            self.textFieldNationality.backgroundColor = textFieldBackground
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
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapView)))
        view.layer.cornerRadius = 3
        //ViewUtils.addLightShadow(self)
        view.clipsToBounds = true
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func didTapView() {
        print("xdxd")
        let picker = CZPickerView(headerTitle: "Nacionalidad", cancelButtonTitle: "Cancelar", confirmButtonTitle: "Seleccionar")
        picker.delegate = self
        picker.dataSource = self
        picker.needFooterView = true
        picker.show()
    }
    
    public func numberOfRowsInPickerView(pickerView: CZPickerView!) -> Int {
        return self.nationalities.count
    }
    
    public func czpickerView(pickerView: CZPickerView!, titleForRow row: Int) -> String! {
        return self.nationalities[row]
    }
    
    public func czpickerView(pickerView: CZPickerView!, didConfirmWithItemAtRow row: Int) {
        self.textFieldNationality.text = self.nationalities[row]
    }
}

