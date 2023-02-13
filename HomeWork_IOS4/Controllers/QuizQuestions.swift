//
//  QuizQuaestions.swift
//  HomeWork_IOS4
//
//  Created by Никита Тарасюк on 13.02.2023.
//

import UIKit

// MARK: - VC StartMenu

class MainQuizQuaestions: UIViewController {
    
    var lablegreat = UILabel()
    var lableReady = UILabel()
    var buttonStart = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        constraintsLable()
        startbutton()
        constraintsButton()
        
        view.backgroundColor = .systemGray5
    }
    
    // MARK: - Настройка лейблов
    
    func setupLabels() {
        view.addSubview(lablegreat)
        lablegreat.translatesAutoresizingMaskIntoConstraints = false
        lablegreat.text = "Greetings \(nameUser)"

        
        view.addSubview(lableReady)
        lableReady.translatesAutoresizingMaskIntoConstraints = false
        lableReady.text = "Are you ready?"

    }
    
    func constraintsLable() {
        NSLayoutConstraint.activate([
            lablegreat.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            lablegreat.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            lableReady.topAnchor.constraint(equalTo: lablegreat.bottomAnchor, constant: 10),
            lableReady.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Настройка кнопок
    
    func startbutton() {
        view.addSubview(buttonStart)
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.setTitle("Start new Quiz", for: .normal)
        buttonStart.setTitleColor(.black, for: .normal)
        buttonStart.tintColor = .systemGray4
        buttonStart.addTarget(self, action: #selector(newQuiz), for: .touchDown)
        buttonStart.configuration = .gray()
        

    }
    
    func constraintsButton() {
        NSLayoutConstraint.activate([
            buttonStart.topAnchor.constraint(equalTo: lableReady.bottomAnchor, constant: 30),
            buttonStart.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func newQuiz() {
        let VCroot = QuizQuaestionOne()
        let VC = UINavigationController( rootViewController: VCroot)
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true) {
        }
    }
}

// MARK: - VC FirstQuestion

class QuizQuaestionOne: UIViewController {
    
    var imageView = UIImageView()
    var firstimage: UIImage!
    var questionLable = UILabel()
    var buttonCorrect = UIButton()
    var buttonWrong = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photos()
        constraintsImages()
        setupLabels()
        constraintsLable()
        setupButton()
        constraintsButton()
        
        view.backgroundColor = .black
    }
    
    // MARK: - Photos
    
    func photos() {
        firstimage = UIImage(named: "FirstIM")!
        
        imageView.image = firstimage
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func constraintsImages() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    // MARK: - Настройка лейблов
    
    func setupLabels() {
        view.addSubview(questionLable)
        questionLable.translatesAutoresizingMaskIntoConstraints = false
        questionLable.text = "How many planets are there in the solar system?"
        questionLable.textColor = .white
    }
    
    func constraintsLable() {
        NSLayoutConstraint.activate([
            questionLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            questionLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Настройка кнопок
    
    func setupButton() {
        view.addSubview(buttonCorrect)
        buttonCorrect.translatesAutoresizingMaskIntoConstraints = false
        buttonCorrect.setTitle("8", for: .normal)
        buttonCorrect.setTitleColor(.white, for: .normal)
        buttonCorrect.tintColor = .systemGray4
        buttonCorrect.addTarget(self, action: #selector(newQuizTrue), for: .touchDown)
        buttonCorrect.configuration = .gray()
        
        view.addSubview(buttonWrong)
        buttonWrong.translatesAutoresizingMaskIntoConstraints = false
        buttonWrong.setTitle("9", for: .normal)
        buttonWrong.setTitleColor(.white, for: .normal)
        buttonWrong.tintColor = .systemGray4
        buttonWrong.addTarget(self, action: #selector(newQuizFalse), for: .touchDown)
        buttonWrong.configuration = .gray()

    }
    
    func constraintsButton() {
        NSLayoutConstraint.activate([
            buttonCorrect.topAnchor.constraint(equalTo: questionLable.bottomAnchor, constant: 30),
            buttonCorrect.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])
        NSLayoutConstraint.activate([
            buttonWrong.topAnchor.constraint(equalTo: questionLable.bottomAnchor, constant: 30),
            buttonWrong.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50)
        ])
    }

    @objc func newQuizTrue() {
        answers = answers + 1
        let VCroot = QuizQuaestionTwo()
        let VC = UINavigationController( rootViewController: VCroot)
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true) {
        }
    }
    
    @objc func newQuizFalse() {
        let VCroot = QuizQuaestionTwo()
        let VC = UINavigationController( rootViewController: VCroot)
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true) {
        }
    }
}

// MARK: - VC SecondQuestion

class QuizQuaestionTwo: UIViewController {
    
    var imageView = UIImageView()
    var firstimage: UIImage!
    var questionLable = UILabel()
    var buttonCorrect = UIButton()
    var buttonWrong = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photos()
        constraintsImages()
        setupLabels()
        constraintsLable()
        setupButton()
        constraintsButton()
        
        view.backgroundColor = .systemGray4
    }
    
    // MARK: - Photos
    
    func photos() {
        firstimage = UIImage(named: "SecondIM")!
        
        imageView.image = firstimage
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func constraintsImages() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: -220),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    // MARK: - Настройка лейблов
    
    func setupLabels() {
        view.addSubview(questionLable)
        questionLable.translatesAutoresizingMaskIntoConstraints = false
        questionLable.text = "Who made the Statue of Liberty?"
        questionLable.textColor = .black
    }
    
    func constraintsLable() {
        NSLayoutConstraint.activate([
            questionLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -180),
            questionLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Настройка кнопок
    
    func setupButton() {
        view.addSubview(buttonCorrect)
        buttonCorrect.translatesAutoresizingMaskIntoConstraints = false
        buttonCorrect.setTitle("France", for: .normal)
        buttonCorrect.setTitleColor(.black, for: .normal)
        buttonCorrect.tintColor = .systemGray4
        buttonCorrect.addTarget(self, action: #selector(newQuizTrue), for: .touchDown)
        buttonCorrect.configuration = .gray()
        
        view.addSubview(buttonWrong)
        buttonWrong.translatesAutoresizingMaskIntoConstraints = false
        buttonWrong.setTitle("USA", for: .normal)
        buttonWrong.setTitleColor(.black, for: .normal)
        buttonWrong.tintColor = .systemGray4
        buttonWrong.addTarget(self, action: #selector(newQuizFalse), for: .touchDown)
        buttonWrong.configuration = .gray()

    }
    
    func constraintsButton() {
        NSLayoutConstraint.activate([
            buttonCorrect.topAnchor.constraint(equalTo: questionLable.bottomAnchor, constant: 30),
            buttonCorrect.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])
        NSLayoutConstraint.activate([
            buttonWrong.topAnchor.constraint(equalTo: questionLable.bottomAnchor, constant: 30),
            buttonWrong.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50)
        ])
    }

    @objc func newQuizTrue() {
        answers = answers + 1
        let VCroot = QuizQuaestionThree()
        let VC = UINavigationController( rootViewController: VCroot)
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true) {
        }
    }
    
    @objc func newQuizFalse() {
        let VCroot = QuizQuaestionThree()
        let VC = UINavigationController( rootViewController: VCroot)
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true) {
        }
    }
}

// MARK: - VC ThirdQuestion

class QuizQuaestionThree: UIViewController {
    
    var imageView = UIImageView()
    var firstimage: UIImage!
    var questionLable = UILabel()
    var buttonCorrect = UIButton()
    var buttonWrong = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photos()
        constraintsImages()
        setupLabels()
        constraintsLable()
        setupButton()
        constraintsButton()
        
        view.backgroundColor = .systemGray5
    }
    
    // MARK: - Photos
    
    func photos() {
        firstimage = UIImage(named: "ThirdIM")!
        
        imageView.image = firstimage
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func constraintsImages() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    // MARK: - Настройка лейблов
    
    func setupLabels() {
        view.addSubview(questionLable)
        questionLable.translatesAutoresizingMaskIntoConstraints = false
        questionLable.text = "Logic riddle. What is the final number?"
        questionLable.textColor = .black
    }
    
    func constraintsLable() {
        NSLayoutConstraint.activate([
            questionLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            questionLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Настройка кнопок
    
    func setupButton() {
        view.addSubview(buttonCorrect)
        buttonCorrect.translatesAutoresizingMaskIntoConstraints = false
        buttonCorrect.setTitle("15", for: .normal)
        buttonCorrect.setTitleColor(.black, for: .normal)
        buttonCorrect.tintColor = .systemGray4
        buttonCorrect.addTarget(self, action: #selector(newQuizFalse), for: .touchDown)
        buttonCorrect.configuration = .gray()
        
        view.addSubview(buttonWrong)
        buttonWrong.translatesAutoresizingMaskIntoConstraints = false
        buttonWrong.setTitle("39", for: .normal)
        buttonWrong.setTitleColor(.black, for: .normal)
        buttonWrong.tintColor = .systemGray4
        buttonWrong.addTarget(self, action: #selector(newQuizTrue), for: .touchDown)
        buttonWrong.configuration = .gray()

    }
    
    func constraintsButton() {
        NSLayoutConstraint.activate([
            buttonCorrect.topAnchor.constraint(equalTo: questionLable.bottomAnchor, constant: 30),
            buttonCorrect.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])
        NSLayoutConstraint.activate([
            buttonWrong.topAnchor.constraint(equalTo: questionLable.bottomAnchor, constant: 30),
            buttonWrong.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50)
        ])
    }

    @objc func newQuizTrue() {
        answers = answers + 1
        let VCroot = FinalOfQuiz()
        let VC = UINavigationController( rootViewController: VCroot)
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true) {
        }
    }
    
    @objc func newQuizFalse() {
        let VCroot = FinalOfQuiz()
        let VC = UINavigationController( rootViewController: VCroot)
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true) {
        }
    }
}

