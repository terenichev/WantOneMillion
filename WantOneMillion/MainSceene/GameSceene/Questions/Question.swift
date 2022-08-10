//
//  Question.swift
//  WantOneMillion
//
//  Created by Денис Тереничев on 05.08.2022.
//

import Foundation

struct Question: Codable {
    let question: String
    let answerOne: String
    let answerTwo: String
    let answerThree: String
    let answerFour: String
    let righthAnswer: String
}
