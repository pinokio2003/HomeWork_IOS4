//
//  LoginButton.swift
//  HomeWork_IOS4
//
//  Created by Anatolii Kravchuk on 12.02.2023.
//

import UIKit

class LoginButton {
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.configuration = .filled()
        button.backgroundColor = UIColor(red: 255,
                                         green: 255,
                                         blue: 240,
                                         alpha: 1)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 3
        button.layer.shadowColor = UIColor.gray.cgColor
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 60
        button.setTitleColor(.gray, for: .normal)
    
        
        return button
    }()
    
    
}
