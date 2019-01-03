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
    var targetValue: Int = 0
    
    @IBOutlet weak var slider:UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        
    }

    @IBAction func showAlert() {

//        var difference: Int
//        if currentValue > targetValue
//        print("The value of the slider is now: \(currentValue)")
//        "\n the target value is \(targetValue)")

        let alert = UIAlertController(title: "Hello, World", message: "The value of the slider is now: \(currentValue)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}
