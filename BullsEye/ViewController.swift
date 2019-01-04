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
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)

        let message = "The value of the slider is now: \(currentValue)\n the target value is \(targetValue) \n difference is \(difference)"

        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        
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
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}
