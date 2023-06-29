//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    
    // DICTIONARY
    let eggTimesLong = ["Soft": 5, "Medium": 7, "Hard": 12]
    let eggTimes = ["Soft": 0.05, "Medium": 0.07, "Hard": 0.12]
    var seconds = 60
    var timer = Timer()
    var progress: Float = 0.0
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar.progress = 0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        // can confidently unwrap because know spellings to be correct and not going to contain nil values
        let hardness = sender.currentTitle!
        let minutes = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        
        titleLabel.text = hardness
        totalTime = Float(minutes * 60)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(eggCountdown), userInfo: nil, repeats: true)
        
    }
    
    @objc func eggCountdown() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = secondsPassed / totalTime
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playAlarm()
        }
    }
    
    func playAlarm() {
        // Tell code where to find the correct sound to play
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        // Gives the audio file specified to the AudioPlayer
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
