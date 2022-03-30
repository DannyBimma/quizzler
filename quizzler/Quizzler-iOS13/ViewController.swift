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
    
    // store question array
    let questionArr = [
        ["Leclerc will be World Champion", "True"], ["Ferrari is best F1 team", "True"], ["Williams will rise again", "False"], ["You will be billionaire", "True"]
    ]
    
    // store question index
    var questionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(questionLabel.text!)
        
        // display question
        updateUI()
        
    }
    
    // link input btns
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        // store user answer
        let userAnswer = sender.currentTitle!
        
        // store correctAnswer
        let correctAnswer = questionArr[questionIndex][1]
        
        // check user answer
        if (userAnswer == correctAnswer) {
            print("CORRECT")
        }
        if (userAnswer != correctAnswer) {
            print("WRONG")
        }
        
        // check question array bounds
        if(questionIndex <= questionArr.count) {
            // change question
            questionIndex += 1
        }
        if (questionIndex >= questionArr.count) {
            questionIndex = 0
        }
        
        // display question
        updateUI()
    }
    
    // create question update function
    func updateUI() {
        questionLabel.text = questionArr[questionIndex][0]
    }
}

