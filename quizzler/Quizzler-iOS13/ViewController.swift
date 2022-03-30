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
    let questionArr = ["Leclerc will be World Champion", "Ferrari is best F1 team", "Williams will rise again", "You will be billionaire"]
    
    // store question index
    var questionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(questionLabel.text!)
        
        // display question
        updateUI()
        
    }
    
    // link user inputs
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        // change question
        questionIndex += 1
        
        // display question
        updateUI()
    }
    
    // create question update function
    func updateUI() {
        questionLabel.text = questionArr[questionIndex]
    }
}

