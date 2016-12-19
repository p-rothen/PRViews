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

@IBDesignable public class PRPickerView: DesignableView, CZPickerViewDelegate, CZPickerViewDataSource {
    
    @IBOutlet public weak var textField: UITextField!
    @IBOutlet weak var viewArrow: UIView!
    
    var nibName:String = "PRPickerView"
    var nationalities = ["Chilena", "Peruana", "Colombiana"]
    public var delegate:PRPickerViewDelegate?
    public var tapHandler: (Void -> Void)?
    
    @IBInspectable var arrowBackground: UIColor? {
        didSet {
            self.viewArrow.backgroundColor = arrowBackground
        }
    }
    
    @IBInspectable var textFieldBackground: UIColor? {
        didSet {
            self.textField.layer.borderColor = textFieldBackground?.CGColor
            self.textField.backgroundColor = textFieldBackground
        }
    }
    
    @IBInspectable var fakePlaceholder: String? {
        didSet {
            self.textField.placeholder = fakePlaceholder
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        super.xibSetup(self.nibName)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapView)))
        self.view.layer.cornerRadius = 3
        ViewUtils.addLightShadow(self)
    }
    
    func didTapView() {
//        print("xdxd")
//        let picker = CZPickerView(headerTitle: "Nacionalidad", cancelButtonTitle: "Cancelar", confirmButtonTitle: "Seleccionar")
//        picker.delegate = self
//        picker.dataSource = self
//        picker.needFooterView = true
//        picker.show()
        
        self.tapHandler?()
    }
    
    public func numberOfRowsInPickerView(pickerView: CZPickerView!) -> Int {
        return self.nationalities.count
    }
    
    public func czpickerView(pickerView: CZPickerView!, titleForRow row: Int) -> String! {
        return self.nationalities[row]
    }
    
    public func czpickerView(pickerView: CZPickerView!, didConfirmWithItemAtRow row: Int) {
        self.textField.text = self.nationalities[row]
    }
}

