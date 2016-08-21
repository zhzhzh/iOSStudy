//
//  ViewController.swift
//  Quiz
//
//  Created by Zhang, Jie on 8/21/16.
//  Copyright © 2016 Jie Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var questionIndex: Int = 0
    var questionArray:[String] = []
    var answerArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        questionArray = [
            "From what is congac made?",
            "What is 7+7?",
            "What is capital of Vermont"
        ]
        
        answerArray = [
            "Grapes",
            "14",
            "Montpelier"
        ]
        
        questionLabel.text = questionArray[questionIndex]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showQuestion(sender: UIButton) {
        questionIndex += 1;
        if (questionIndex == questionArray.count) {
            questionIndex = 0
        }
        
        questionLabel.text = questionArray[questionIndex]
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: UIButton) {
        answerLabel.text = answerArray[questionIndex]
    }
    

}

