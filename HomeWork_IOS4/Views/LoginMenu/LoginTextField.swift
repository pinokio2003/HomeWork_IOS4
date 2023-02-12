//
//  LoginTextField.swift
//  HomeWork_IOS4
//
//  Created by Anatolii Kravchuk on 11.02.2023.
//


import UIKit

class LoginTextField{
    
    let textField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
//        field.placeholder = "print notes "
        field.borderStyle = .roundedRect
//        field.inputAccessoryView = .none
        field.keyboardType = .default
        field.textAlignment = .left
        //field.delegate = self
        field.keyboardAppearance = .default
        field.clearButtonMode = .always
        field.font = UIFont(name: "Copperplate-Bold" ,size: 20)
        field.layer.shadowRadius = 5
        field.layer.shadowOpacity = 3
        field.layer.shadowColor = UIColor.gray.cgColor
        
        return field
    }()
}

