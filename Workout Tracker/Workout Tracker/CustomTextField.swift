//
//  CustomTextField.swift
//  Workout Tracker
//
//  Created by Seschwan on 3/18/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
        doneBarBtn()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
        doneBarBtn()
    }

    func setupTextField() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.lightGray.cgColor
        textColor = .white
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
       
       override func textRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
       
       override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
       
       override func editingRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
    
    func doneBarBtn() {
        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([flexibleSpace,doneButton], animated: false)
        toolBar.sizeToFit()
        inputAccessoryView = toolBar
        
    }
    
    @objc func doneClicked() {
        endEditing(true)
    }
}
