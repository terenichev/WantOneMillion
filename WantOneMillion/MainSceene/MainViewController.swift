//
//  ViewController.swift
//  WantOneMillion
//
//  Created by Денис Тереничев on 05.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var showResultsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Play",
           let destinationVC = segue.destination as? GameViewController
        {
            destinationVC.gameSession.numberOfQuestions = questionsArray.count
            destinationVC.gameSession.stage = 0
        }
        
    }
    
}

