//
//  ViewController.swift
//  Project 2 (Guess the flag)
//
//  Created by Zeeshan Waheed on 19/01/2024.
//

import UIKit

var correctAnswer = Int.random(in: 0...2)
var timesTapped = 0

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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(scoreTapped))
    }

    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        title = countries[correctAnswer].uppercased() + " - Score is \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
//        title = countries[correctAnswer].uppercased() + " - Score is \(score)"
        timesTapped += 1
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        
        if timesTapped < 10 {
            var ac = UIAlertController(title: "Continue", message: "Your score is \(score)", preferredStyle: .alert)
            if title == "Correct" {
                ac = UIAlertController(title: "Correct", message: "Your score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            } else {
                ac = UIAlertController(title: "Wrong, that's not the flag of \(countries[correctAnswer])", message: "Your score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            }
            present(ac,animated: true)
        } else {
            timesTapped = 0
            let alert = UIAlertController(title: "You've answered 10 questions!", message: "Your final score is \(score)", preferredStyle: .alert)
            score = 0
            alert.addAction(UIAlertAction(title: "close", style: .cancel, handler: askQuestion))
            present(alert,animated: true)
        }
        
    }
    
    @objc func scoreTapped() {
        let vc = UIAlertController(title: "Score", message: String(score), preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(vc, animated: true)
    }
    
}

