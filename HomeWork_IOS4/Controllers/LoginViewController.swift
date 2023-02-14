//
//  LoginViewController.swift
//  HomeWork_IOS4
//
//  Created by Anatolii Kravchuk on 10.02.2023.
//

import UIKit

class Login: UIViewController, UITextFieldDelegate{
    
    let toolBar = UIToolbar()
    let toolBarPass = UIToolbar()
    let lable = LoginLabeleClass()
    let lableInfo = LoginLabeleClass()
    let loginTextField = LoginTextField()
    let passTextField = LoginTextField()
    let loginButton = LoginButton()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1)
        DoneButtonLogginSetup()
        lableSetup()
        lableInfoSetup()
        DoneButtonPasswordSetup()
        buttonSetup()
        userFieldSetup()
        passFieldSetup()
        constraine()
    }
  //MARK: - setup
    func lableSetup(){
        let lbl = lable.loginLable
        view.addSubview(lbl)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Please login"
    }
    
    func lableInfoSetup(){
        let lbl = lableInfo.loginLable
        view.addSubview(lbl)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.text = ""
    }
    
    func userFieldSetup(){
        let login = loginTextField.textField
        view.addSubview(login)
        login.inputAccessoryView = toolBar
        login.delegate = self
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "User Name"
        login.clearButtonMode = .always
    }
    
    func passFieldSetup(){
        let login = passTextField.textField
        view.addSubview(login)
        login.delegate = self
        login.inputAccessoryView = toolBarPass
        login.isSecureTextEntry = true
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "Password"
        login.clearButtonMode = .always
    }
    
    func buttonSetup(){
        let button = loginButton.button
        view.addSubview(button)
        button.backgroundColor = UIColor(red: 255, green: 255, blue: 240, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(chechPassword), for: .touchDown)
    }
    
   //MARK: - Constraints:
    func constraine(){
        NSLayoutConstraint.activate([
            
            lable.loginLable.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -200),
            lable.loginLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTextField.textField.topAnchor.constraint(equalTo: lable.loginLable.bottomAnchor, constant: 30),
            loginTextField.textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30),
            loginTextField.textField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            loginTextField.textField.heightAnchor.constraint(equalToConstant: 50),
            
            passTextField.textField.topAnchor.constraint(equalTo: loginTextField.textField.bottomAnchor, constant: 30),
            passTextField.textField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30),
            passTextField.textField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            passTextField.textField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.button.topAnchor.constraint(equalTo:passTextField.textField.bottomAnchor, constant: 30),
            loginButton.button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.button.heightAnchor.constraint(equalToConstant: 120),
            loginButton.button.widthAnchor.constraint(equalToConstant: 120),
            
            lableInfo.loginLable.topAnchor.constraint(equalTo: loginButton.button.bottomAnchor, constant: 30),
            lableInfo.loginLable.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30),
            lableInfo.loginLable.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            
        ])
    }
    //MARK: - "Done" button login setup:
    func DoneButtonLogginSetup() {
        toolBar.sizeToFit()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem:.flexibleSpace,
                                            target: self,
                                            action: nil)
        
        let buttonDone = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(doneButtonLoggin))
        toolBar.setItems([flexibleSpace, buttonDone], animated: true)

    }
//    //MARK: - "Done" button password setup:
    func DoneButtonPasswordSetup() {
        toolBarPass.sizeToFit()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem:.flexibleSpace,
                                            target: self,
                                            action: nil)

        let buttonDone = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(doneButtonPass))
        toolBarPass.setItems([flexibleSpace, buttonDone], animated: true)

    }
    //MARK: - Done button selector login:
    @objc func doneButtonLoggin(_ sender: UIBarButtonItem){
        loginTextField.textField.resignFirstResponder()
//        passTextField.textField.isEnabled = true
        print("Name user: \(nameUser)")
        
    }
    
    //MARK: - Done button selector password:
    @objc func doneButtonPass(_ sender: UIBarButtonItem){
        passTextField.textField.resignFirstResponder()
//        loginTextField.textField.isEnabled = true
        print("Password user: \(passwordUser)")
    }
    //MARK: - сохранить дату в моделе:
    // функция сохоаняет каждый символ который появляеться на textField, мы просто сохраняем каждый раз в стрингу
        
    func textFieldDidChangeSelection(_ textField: UITextField) {
        nameUser = loginTextField.textField.text ?? ""
        passwordUser = passTextField.textField.text ?? ""
    }
    //MARK: - check password
    
    @objc func chechPassword(){
        let key = nameUser
        let value = passwordUser
        let quizController = MainQuizQuaestions()
        
        if passwords.keys.contains(key) && passwords.values.contains(value){
            lableInfo.loginLable.text = "Welcome to game"
            
            quizController.modalPresentationStyle = .fullScreen
            present(quizController, animated: true) {
                print("Go to quiz")
                
            }
        } else {
            lableInfo.loginLable.text = "Password incorrect"
        }
    }
}
