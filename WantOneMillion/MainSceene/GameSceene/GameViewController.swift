//
//  GameViewController.swift
//  WantOneMillion
//
//  Created by Денис Тереничев on 05.08.2022.
//

import UIKit

class GameViewController: UIViewController {
    var gameSession = GameSession()
    var questions = questionsArray
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Question"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var answerOneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("answer 1", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        
        button.addTarget(self, action: #selector(buttonOneAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var answerTwoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("answer 2", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonTwoAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var answerThreeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("answer 3", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonThreeAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var answerFourButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("answer 4", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonFourAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Game.shared.isRandomQuestions {
            questions.shuffle()
            print(questions)
        }
        
        if gameSession.stage <= 9 {
            questionLabel.text = questions[gameSession.stage].question
            answerOneButton.setTitle(questions[gameSession.stage].answerOne, for: .normal)
            answerTwoButton.setTitle(questions[gameSession.stage].answerTwo, for: .normal)
            answerThreeButton.setTitle(questions[gameSession.stage].answerThree, for: .normal)
            answerFourButton.setTitle(questions[gameSession.stage].answerFour, for: .normal)
            setupGameConstraints()
        } else {
            questionLabel.text = "Поздравляем! Вы - Миллионер!"
            saveRecord()
            setupEndGameConstraints()
        }
        
    }
    
    func setupEndGameConstraints() {
        self.view.addSubview(questionLabel)
        answerOneButton.removeFromSuperview()
        answerTwoButton.removeFromSuperview()
        answerThreeButton.removeFromSuperview()
        answerFourButton.removeFromSuperview()
        
        
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
            questionLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 10),
            questionLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            questionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            ])
        
    }
    
    func setupGameConstraints() {
        
        self.view.addSubview(questionLabel)
        self.view.addSubview(answerOneButton)
        self.view.addSubview(answerTwoButton)
        self.view.addSubview(answerThreeButton)
        self.view.addSubview(answerFourButton)
        
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            questionLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 10),
//            questionLabel.heightAnchor.constraint(equalToConstant: 100),
            questionLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            questionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            
            answerOneButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            answerOneButton.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -10),
            answerOneButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 50),
            answerOneButton.heightAnchor.constraint(equalToConstant: 40),
            
            answerTwoButton.topAnchor.constraint(equalTo: answerOneButton.topAnchor),
            answerTwoButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            answerTwoButton.leftAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
//            answerTwoButton.heightAnchor.constraint(equalToConstant: 40),
            
            answerThreeButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
            answerThreeButton.rightAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -10),
            answerThreeButton.topAnchor.constraint(equalTo: answerOneButton.bottomAnchor, constant: 20),
//            answerThreeButton.heightAnchor.constraint(equalToConstant: 40),
            
            answerFourButton.topAnchor.constraint(equalTo: answerThreeButton.topAnchor),
            answerFourButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
            answerFourButton.leftAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
//            answerFourButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    @objc func buttonOneAction() {
        if answerOneButton.titleLabel?.text == questions[self.gameSession.stage].righthAnswer {
            nextStage()
        } else {
            saveRecord()
            loseGame()
        }
    }
    
    @objc func buttonTwoAction() {
        if answerTwoButton.titleLabel?.text == questions[self.gameSession.stage].righthAnswer {
            nextStage()
        } else {
            saveRecord()
            loseGame()
        }
    }
    
    @objc func buttonThreeAction() {
        if answerThreeButton.titleLabel?.text == questions[self.gameSession.stage].righthAnswer {
            nextStage()
        } else {
            saveRecord()
            loseGame()
        }
    }
    
    @objc func buttonFourAction() {
        if answerFourButton.titleLabel?.text == questions[self.gameSession.stage].righthAnswer {
            nextStage()
        } else {
            saveRecord()
            loseGame()
        }
    }
    
    private func nextStage() {
        self.gameSession.stage += 1
        self.viewDidLoad()
    }
    
    private func saveRecord() {
        let record = Record(date: Date(), score: self.gameSession.stage * 100000)
        Game.shared.addRecord(record)
    }
    
    private func loseGame() {
        questionLabel.text = "Ответ неверный, может повезет в следующий раз? Выигрыш составил \(self.gameSession.stage * 100000) руб."
        setupEndGameConstraints()
    }
}


