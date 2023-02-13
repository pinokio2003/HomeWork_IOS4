//
//  FinalOfQuiz.swift
//  HomeWork_IOS4
//
//  Created by Никита Тарасюк on 13.02.2023.
//

import UIKit

    // MARK: - VC финала

class FinalOfQuiz: UIViewController {
    
    
    var greetings = UILabel()
    var quantityOfAnswers = UILabel()
    var finalWord = UILabel()
    var newQyizButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        constraintsLable()
        backbutton()
        constraintsButton()
        
        view.backgroundColor = .systemGray5
    }
    
    // MARK: - Настройка лейблов
    
    func setupLabels() {
        view.addSubview(greetings)
        greetings.translatesAutoresizingMaskIntoConstraints = false
        greetings.text = "Congratulations \(nameUser)"

        
        
        view.addSubview(quantityOfAnswers)
        quantityOfAnswers.translatesAutoresizingMaskIntoConstraints = false
        quantityOfAnswers.text = "Number of correct answers: \(answers)"

        
        view.addSubview(finalWord)
        finalWord.translatesAutoresizingMaskIntoConstraints = false
        finalWord.text = "You win ---->>>> NOTHING"

    }
    
    
    func constraintsLable() {
        NSLayoutConstraint.activate([
            greetings.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            greetings.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            quantityOfAnswers.topAnchor.constraint(equalTo: greetings.bottomAnchor, constant: 10),
            quantityOfAnswers.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            finalWord.topAnchor.constraint(equalTo: quantityOfAnswers.bottomAnchor, constant: 10),
            finalWord.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Настройка кнопок
    
    func backbutton() {
        view.addSubview(newQyizButton)
        newQyizButton.translatesAutoresizingMaskIntoConstraints = false
        newQyizButton.setTitle("Start new Quiz", for: .normal)
        newQyizButton.setTitleColor(.black, for: .normal)
        newQyizButton.tintColor = .systemGray4
        newQyizButton.addTarget(self, action: #selector(newQuiz), for: .touchDown)
        newQyizButton.configuration = .gray()
        

    }
    
    func constraintsButton() {
        NSLayoutConstraint.activate([
            newQyizButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            newQyizButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func newQuiz() {
        answers = 0
        let VCroot = MainQuizQuaestions()
        let VC = UINavigationController( rootViewController: VCroot)
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true) {
        }
    }
    
}
