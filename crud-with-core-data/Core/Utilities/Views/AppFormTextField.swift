//
//  CustomAppTextField.swift
//  cud-user-app-programmatic
//
//  Created by DNA-User on 7/28/23.
//

import UIKit

class AppFormTextField: UITextField {
    
    var padding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureTextField()
    }
   	 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeHolder: String, keyboardType: UIKeyboardType) {
        self.init(frame: .zero)
        self.placeholder = placeHolder
        self.keyboardType = keyboardType
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    private func configureTextField(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 15)
        text = ""
        autocorrectionType = .no
        layer.borderColor = AppColors.dustChimney.rawValue.cgColor
        layer.borderWidth = 1.5
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}

