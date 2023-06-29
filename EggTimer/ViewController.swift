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
    var seconds = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        // can confidently unwrap because know spellings to be correct and not going to contain nil values
        let hardness = sender.currentTitle!
        let minutes = eggTimes[hardness]!
        
        seconds = minutes * 60
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    
        
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
    
    @objc func updateCounter() {
        //example functionality
        if seconds > 0 {
            print("\(seconds) seconds.")
            seconds -= 1
        }
    }
    
}
