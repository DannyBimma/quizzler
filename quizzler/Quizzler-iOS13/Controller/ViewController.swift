//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(questionLabel.text!)
        
        // display initial question
        updateUI()
    }
    
    // link elements
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    // link Model
    var quizzLogic = QuizzLogic()
    
    // link answer input btns
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        // store user answer
        let userAnswer = sender.currentTitle!
        
        // store user answer check
        let userCorrect = quizzLogic.checkAnswer(userAnswer: userAnswer)
        
        // check user answer
        if userCorrect {
            print("CORRECT")
            sender.backgroundColor = UIColor.green
        } else {
            print("WRONG")
            sender.backgroundColor = UIColor.red
        }
        
        // display next question
        quizzLogic.nextQuestion()
        
        // display question
        updateUI()
    }
    
    // create UI update function
    func updateUI() {
        // display next question
        questionLabel.text = quizzLogic.getQuestion()
        
        // reset btn colour after 0.2s timeout
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.trueBtn.backgroundColor = UIColor.clear
            self.falseBtn.backgroundColor = UIColor.clear
        }
        
        // fill progress bar
        progressBar.progress = quizzLogic.showProgress()
        
        // update score
        scoreLabel.text = "Score: \(quizzLogic.getScore())"
    }
}

