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
    
    private(set) var records: [Record] {
        didSet {
        recordsCaretaker.save(records: self.records)
        }
    }
    
    private(set) var session: GameSession?
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
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
