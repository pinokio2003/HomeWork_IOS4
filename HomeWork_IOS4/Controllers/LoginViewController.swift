//
//  LoginViewController.swift
//  HomeWork_IOS4
//
//  Created by Anatolii Kravchuk on 10.02.2023.
//

import UIKit

class Login: ViewController{
    
    let loginTextField = LoginTextField()
    let passTextField = LoginTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        userFieldSetup()
        passFieldSetup()
        constraine()
    }
    
    func userFieldSetup(){
        let login = loginTextField.textField
        view.addSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "Login"
    }
    
    func passFieldSetup(){
        let login = passTextField.textField
        view.addSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "Password"
    }
    
    func constraine(){
        NSLayoutConstraint.activate([
            
            loginTextField.textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            loginTextField.textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30),
            loginTextField.textField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            loginTextField.textField.heightAnchor.constraint(equalToConstant: 50),
            
            passTextField.textField.topAnchor.constraint(equalTo: loginTextField.textField.bottomAnchor, constant: 20),
            passTextField.textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30),
            passTextField.textField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            passTextField.textField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}
