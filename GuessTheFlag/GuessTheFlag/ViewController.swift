//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Ian Huettel on 4/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    var score = 0
    var correctAnswer = Int()
    
    func askQuestion() {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " | Score: \(score)"
        
        let buttons = [button1!, button2!, button3!]
        
        for (i, button) in buttons.enumerated() {
            button.setImage(UIImage(named: countries[i]), for: .normal)
        }
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct!"
        } else {
            title = "Try again.."
        }
        askQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = [button1!, button2!, button3!]
        
        for button in buttons {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        askQuestion()
    }


}

