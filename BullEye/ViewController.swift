//
//  ViewController.swift
//  BullEye
//
//  Created by Naruapon Suwanwijit on 15/4/2561 BE.
//  Copyright © 2561 Naruapon Suwanwijit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        //targetValue = 1 + Int(arc4random_uniform(100))
        startNewRound()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
    }

    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert(){
        
//        var difference: Int
//        if currentValue > targetValue{
//            difference = currentValue - targetValue
//        } else if targetValue > currentValue {
//            difference = targetValue - currentValue
//        } else {
//            difference = 0
//        }
        
//        var difference : Int = currentValue - targetValue
//        if difference < 0 {
//            difference *= -1
//        }
        
        let difference : Int = abs(currentValue - targetValue)
        
        let message = "The value of slider is: \(currentValue)" +
                        "\nThe target value is: \(targetValue)" +
                        "\nThe differnce is: \(difference)"
        
        
        let alert = UIAlertController(title: "Show Hello", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion:nil)
        
        startNewRound()
        
    }


}

