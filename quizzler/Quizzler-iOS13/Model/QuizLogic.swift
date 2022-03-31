//
//  QuizLogic.swift
//  Quizzler-iOS13
//
//  Created by Daniel Trotman on 31/03/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizzLogic {
    // store quizz array using the Questions struct
    let quizzArr = [
        Questions(question: "Leclerc will be World Champion", answer: "True"),
        Questions(question: "Ferrari is best F1 team", answer: "True"),
        Questions(question: "Williams will rise again", answer: "False"),
        Questions(question: "You will be a billionaire", answer: "True")
    ]
    
    // store question index
    var questionIndex: Int = 0
    
    // store score
    var score: Int = 0
    
    // return score
    func getScore() -> Int {
        return score
    }
    
    // check answer
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quizzArr[questionIndex].answer {
            print("CORRECT IS RIGHT!")
            score += 1
            return true
        } else {
            print("YA WRONG LIKE COW DUNG!")
            return false
        }
    }
    
    // get question
    func getQuestion() -> String {
        return quizzArr[questionIndex].question
    }
    
    // advance progress bar
    func showProgress() -> Float {
        return Float(questionIndex + 1) / Float(quizzArr.count)
    }
    
    // quizz progression
    mutating func nextQuestion() {
        // check question array bounds
        if(questionIndex <= quizzArr.count) {
            // index next question
            questionIndex += 1
        }
        if (questionIndex >= quizzArr.count) {
            questionIndex = 0
            score = 0
        }
    }
     
}
