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

    
    
//MARK: - Login Button import settings
    
    let loginButton: LoginButton = {
        let button = LoginButton()
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 20)
        button.setTitleColor(.gray, for: .normal)
        button.setTitle("Sigin", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//MARK: - Login TextField import settings
    
    let loginTextField: LoginTextField = {
        let login = LoginTextField()
        login.backgroundColor = .customBackgroundColor
        login.font = UIFont(name: "Avenir-Black", size: 20)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "User Name"
        login.clearButtonMode = .always
        login.keyboardType = .default
        login.textAlignment = .center
        login.keyboardAppearance = .default
        login.clearButtonMode = .always
        return login
    }()
//MARK: - Password TextField import settings
    
    let passTextField: LoginTextField = {
        let pass = LoginTextField()
        pass.backgroundColor = .customBackgroundColor
        pass.font = UIFont(name: "Avenir-Black", size: 20)
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.placeholder = "Password"
        pass.clearButtonMode = .always
        pass.keyboardType = .default
        pass.textAlignment = .center
        pass.keyboardAppearance = .default
        pass.clearButtonMode = .always
        pass.isSecureTextEntry = true
        return pass
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        DoneButtonLogginSetup()
        lableSetup()
        lableInfoSetup()
        DoneButtonPasswordSetup()
        buttonSetup()
        userFieldSetup()
        passFieldSetup()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        constraine()
        loginButton.layer.cornerRadius = 60
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
    //textField - Login
    func userFieldSetup(){
        view.addSubview(loginTextField)
        loginTextField.inputAccessoryView = toolBar
        loginTextField.delegate = self
    }
    //textField - Password
    func passFieldSetup(){
        
        view.addSubview(passTextField)
        passTextField.delegate = self
        passTextField.inputAccessoryView = toolBarPass
    }
    
//MARK: - Button
    func buttonSetup(){
        view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(chechPassword), for: .touchDown)
        loginButton.addTarget(self, action: #selector(unTuchFunc), for: .touchUpOutside)
        loginButton.addTarget(self, action: #selector(unTuchFunc), for: .touchUpInside)
    }
    
   //MARK: - Constraints:
    func constraine(){
        NSLayoutConstraint.activate([
            
            lable.loginLable.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -200),
            lable.loginLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: lable.loginLable.bottomAnchor, constant: 30),
            loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30),
            loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            passTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30),
            passTextField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo:passTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 120),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            
            lableInfo.loginLable.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
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
        loginTextField.resignFirstResponder()
//        passTextField.textField.isEnabled = true
        print("Name user: \(nameUser)")
        
    }
    
    //MARK: - Done button selector password:
    @objc func doneButtonPass(_ sender: UIBarButtonItem){
        passTextField.resignFirstResponder()
//        loginTextField.textField.isEnabled = true
        print("Password user: \(passwordUser)")
    }
    //MARK: - сохранить дату в моделе:
    // функция сохоаняет каждый символ который появляеться на textField, мы просто сохраняем каждый раз в стрингу
        
    func textFieldDidChangeSelection(_ textField: UITextField) {
        nameUser = loginTextField.text ?? ""
        passwordUser = passTextField.text ?? ""
    }
    //MARK: - check password
    
    @objc func chechPassword(){
        let key = nameUser
        let value = passwordUser
        let quizController = MainQuizQuaestions()
        
        if passwords.keys.contains(key) && passwords.values.contains(value){
            tuchFunc()
            lableInfo.loginLable.text = "Welcome to game"
            
            quizController.modalPresentationStyle = .fullScreen
            present(quizController, animated: true) {
                print("Go to quiz")
                
            }
        } else {
            tuchFunc()
            lableInfo.loginLable.text = "Password incorrect"
        }
    }
    //MARK: - Изменение настроек для анимации кнопки:
    @objc func tuchFunc(){
        loginButton.darkShadow.shadowOffset = CGSize(width: -7, height: -7)
        loginButton.lightShadow.shadowOffset = CGSize(width: 9, height: 9)
        loginButton.darkShadow.shadowOpacity = 0.2
        loginButton.lightShadow.shadowOpacity = 0.9
      
    }
    
    @objc func unTuchFunc(){
        loginButton.darkShadow.shadowOffset = CGSize(width: 10, height: 10)
        loginButton.lightShadow.shadowOffset = CGSize(width: -7, height: -7)
        loginButton.darkShadow.shadowOpacity = 0.15
        loginButton.lightShadow.shadowOpacity = 0.5
    }
}
