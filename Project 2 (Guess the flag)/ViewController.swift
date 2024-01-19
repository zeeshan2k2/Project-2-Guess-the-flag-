//
//  ViewController.swift
//  Project 2 (Guess the flag)
//
//  Created by Zeeshan Waheed on 19/01/2024.
//

import UIKit

var correctAnswer = Int.random(in: 0...2)

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        

        button1.layer.borderWidth = 12
        button2.layer.borderWidth = 12
        button3.layer.borderWidth = 12
        
        button1.layer.frame = button1.frame
        button2.layer.frame = button1.frame
        button3.layer.frame = button1.frame
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        title = countries[correctAnswer].uppercased()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String 
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: "Continue", message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac,animated: true)
    }
    
    
    
    
}

