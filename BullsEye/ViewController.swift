//
//  ViewController.swift
//  BullsEye
//
//  Created by piyush mehta on 03/01/19.
//  Copyright © 2019 piyushmehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello, World", message: "Let's start", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
        let roundedValue = slider.value.rounded()
        print("The value of the slider is now: \(roundedValue)")
        currentValue = Int(slider.value)
    }
}
