//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // DICTIONARY
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // can confidently unwrap because know spellings to be correct and not going to contain nil values
        let hardness = sender.currentTitle!
        let seconds = eggTimes[hardness]!
        
        var secondsRemaining = seconds * 60
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if secondsRemaining > 0 {
                    print ("\(secondsRemaining) seconds.")
                    secondsRemaining -= 1
                } else {
                    Timer.invalidate()
                }
            }

//        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: seconds, repeats: true)

        
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        default:
//            print(hardTime)
//        }
        
//        Optional Strings are automatically unwrapped when used in comparison?
//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium" {
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }
        
    }
    
    @objc func updateCounter(time: Int) {
        var time = time
        //example functionality
        if time > 0 {
            print("\(time) seconds.")
            time -= 1
        }
    }
    
}
