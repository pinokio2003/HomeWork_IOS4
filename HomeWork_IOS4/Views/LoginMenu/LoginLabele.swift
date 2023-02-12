//
//  LoginLabeleClass.swift
//  HomeWork_IOS4
//
//  Created by Anatolii Kravchuk on 12.02.2023.
//

import UIKit

class LoginLabeleClass{
    
    let loginLable: UILabel = {
        let lable = UILabel()
        lable.text = "Login"
        lable.font = UIFont(name: "Copperplate-Bold" ,size: 35)
        lable.textColor = UIColor(red: 255,
                                  green: 255,
                                  blue: 240,
                                  alpha: 1)
        lable.layer.shadowColor = UIColor.gray.cgColor
        lable.layer.shadowRadius = 5
        lable.layer.shadowOpacity = 3
        return lable
    }()
}
