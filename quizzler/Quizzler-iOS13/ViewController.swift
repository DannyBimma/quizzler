//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // link elements
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueBtn: UIButton!
    
    @IBOutlet weak var falseBtn: UIButton!
    
    // store quizz array using the Questions struct
    let quizzArr = [
        Questions(question: "Leclerc will be World Champion", answer: "True"),
        Questions(question: "Ferrari is best F1 team", answer: "True"),
        Questions(question: "Williams will rise again", answer: "False"),
        Questions(question: "You will be a billionaire", answer: "True")
    ]
    
    // store question index
    var questionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(questionLabel.text!)
        
        // display initial question
        updateUI()
    }
    
    // link answer input btns
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        // store user answer
        let userAnswer = sender.currentTitle!
        
        // store correctAnswer
        let correctAnswer = quizzArr[questionIndex].answer
        
        // check user answer
        if (userAnswer == correctAnswer) {
            print("CORRECT")
            sender.backgroundColor = UIColor.green
        }
        if (userAnswer != correctAnswer) {
            print("WRONG")
            sender.backgroundColor = UIColor.red
        }
        
        // check question array bounds
        if(questionIndex <= quizzArr.count) {
            // index next question
            questionIndex += 1
        }
        if (questionIndex >= quizzArr.count) {
            questionIndex = 0
        }
        
        // display question
        updateUI()
    }
    
    // create question update function
    func updateUI() {
        // display next question
        questionLabel.text = quizzArr[questionIndex].question
        
        // reset btn colour after 0.2s timeout
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
           // Code you want to be delayed
            self.trueBtn.backgroundColor = UIColor.clear
            self.falseBtn.backgroundColor = UIColor.clear
        }
        
        // fill progress bar
        progressBar.progress = Float(questionIndex + 1) / Float(quizzArr.count)
    }
}

