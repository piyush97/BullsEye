//
//  ViewController.swift
//  BullsEye
//
//  Created by piyush mehta on 03/01/19.
//  Copyright © 2019 piyushmehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var roundNumber = 1

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var RoundLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = (100 - difference)
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            points += 50
        } else if difference < 10 {
            title = "Pretty Good"
        } else {
            title = "Not even Close..."
        }
        let message = "The value of the slider is now: \(currentValue)\n the target value is \(targetValue) \n difference is \(difference)"

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }

    @IBAction func sliderMoved(slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        roundNumber += 1
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
        ScoreLabel.text = String(score)
        RoundLabel.text = String(roundNumber)
    }
    
 @IBAction func startNewGame() {
        score = 0
        roundNumber = 1
        startNewRound()
    }
    
}
