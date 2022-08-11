//
//  SettingsViewController.swift
//  WantOneMillion
//
//  Created by Денис Тереничев on 10.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var randomQuestionsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomQuestionsSwitch.isOn = Game.shared.isRandomQuestions
    }
    
    @IBAction func randomSwitchAction(_ sender: UISwitch) {
        Game.shared.isRandomQuestions.toggle()
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
}
