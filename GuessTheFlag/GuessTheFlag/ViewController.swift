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
    
    func askQuestion() {
        
        countries.shuffle()
        
        let correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        
        let buttons = [button1!, button2!, button3!]
        
        for (i, button) in buttons.enumerated() {
            button.setImage(UIImage(named: countries[i]), for: .normal)
        }
        
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

