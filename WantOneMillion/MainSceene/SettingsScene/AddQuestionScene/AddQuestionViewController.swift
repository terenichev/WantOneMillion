//
//  AddQuestionViewController.swift
//  WantOneMillion
//
//  Created by Денис Тереничев on 10.08.2022.
//

import UIKit

class AddQuestionViewController: UIViewController {
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var firstAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var thirdAnswerTextField: UITextField!
    @IBOutlet weak var fourthAnswerTextField: UITextField!
    
    @IBOutlet weak var rightAnswerTextField: UITextField!
    @IBOutlet weak var saveQuestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveQuestionAction(_ sender: Any) {
        
        guard questionTextField.text != "" else {
            let errorQuestionAlert = UIAlertController(title: "Ошибка", message: "Заполните поле вопроса", preferredStyle: .alert)
            let errorQuestionAlertAction = UIAlertAction(title: "OK", style: .default)
            errorQuestionAlert.addAction(errorQuestionAlertAction)
            self.present(errorQuestionAlert, animated: true)
            return
        }
        
        guard firstAnswerTextField.text != "" && secondAnswerTextField.text != "" && thirdAnswerTextField.text != "" && fourthAnswerTextField.text != "" && rightAnswerTextField.text != ""  else {
            let errorAnswerAlert = UIAlertController(title: "Ошибка", message: "Должны быть заполнены все поля с ответами", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            errorAnswerAlert.addAction(alertAction)
            self.present(errorAnswerAlert, animated: true)
            return
        }
        
        let newQestion = Question(question: questionTextField.text!, answerOne: firstAnswerTextField.text!, answerTwo: secondAnswerTextField.text!, answerThree: thirdAnswerTextField.text!, answerFour: fourthAnswerTextField.text!, righthAnswer: rightAnswerTextField.text!)
        Game.shared.addCustomQuestion(newQestion)
        
        let accessAlert = UIAlertController(title: nil, message: "Вопрос добавлен", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        accessAlert.addAction(alertAction)
        self.present(accessAlert, animated: true)
    }
    
}
