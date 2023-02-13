//
//  QuizController.swift
//  HomeWork_IOS4
//
//  Created by Vladymyr Kravchuk on 11.02.2023.
//

import UIKit

class QuizController: UIViewController {
    let viewTitle = UILabel()
    
    let buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Left", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Right", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        view.backgroundColor = .white
        setupLabel()
        addConstraints()
        buttonOne.addTarget(self, action: #selector(pushOne), for: .touchUpInside)
 //       buttonTwo.addTarget(self, action: #selector(pushTwo), for: .touchUpInside)
    }
    
    func setupLabel() {
        viewTitle.text = "Left or Right"
        viewTitle.frame = CGRect(x: 120, y: 50, width: 250, height: 80)
        viewTitle.textColor =  .cyan
        viewTitle.font = .systemFont(ofSize: 25)
        view.addSubview(viewTitle)
    }
}
extension QuizController {
    private func setupSubviews() {
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
    }
    
    private func addConstraints() {
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            buttonOne.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            buttonOne.widthAnchor.constraint(equalToConstant: 100),
        ])
        NSLayoutConstraint.activate([
            buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            buttonTwo.widthAnchor.constraint(equalToConstant: 100),
            buttonTwo.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 20)
        ])
    }
    @objc private func pushOne() {
        
        let quizController = ViewController()
        quizController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(quizController, animated: true)
    }
    
}
