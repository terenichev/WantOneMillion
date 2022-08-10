//
//  GameSingleton.swift
//  WantOneMillion
//
//  Created by Денис Тереничев on 08.08.2022.
//

import Foundation

struct Record: Codable {
    let date: Date
    let score: Int
}

class Game {
    
    static let shared = Game()
    
    private let recordsCaretaker = RecordsCaretaker()
    private let questionsCaretaker = QuestionsCaretaker()
    
    private(set) var records: [Record] {
        didSet {
        recordsCaretaker.save(records: self.records)
        }
    }
    
    var questions: [Question] {
        didSet {
            questionsCaretaker.save(questions: self.questions)
        }
    }
    
    private(set) var session: GameSession?
    var isRandomQuestions: Bool = false
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.questions = self.questionsCaretaker.retrieveQuestions()
    }
    
    func addCustomQuestion(_ question: Question) {
        self.questions.append(question)
    }
    
    func deleteCustomQuestions() {
        self.questions = questionsArray
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
}

class GameSession {
    var numberOfQuestions: Int = 0
    var answeredQuestions: Int = 0
    var stage: Int = 0
}
