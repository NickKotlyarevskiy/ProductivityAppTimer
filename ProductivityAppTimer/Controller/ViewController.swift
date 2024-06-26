//
//  ViewController.swift
//  ProductivityAppTimer
//
//  Created by Nikita Kotlyarevskiy on 20.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var mainTimer = Timer()
    
    @IBOutlet weak var TextSelector: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    var minutes = 0
    var seconds = 0
    var stableSecondsCounter = 0
    
    override func viewDidLoad() {
        TextSelector.text = "Press start button"
        resetWorkTimer()
        updateUI()
    }

    func resetWorkTimer() {
        minutes = 45
        seconds = 0
        stableSecondsCounter = minutes * 60 + seconds
        timerProgress.progress = 0
    }
    
    func resetRelaxTimer() {
        minutes = 15
        seconds = 0
        stableSecondsCounter = minutes * 60 + seconds
        timerProgress.progress = 0
    }

    func updateUI() {
        let minutesString = String(format: "%02d", minutes)
        let secondsString = String(format: "%02d", seconds)
        timer.text = "\(minutesString):\(secondsString)"
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        TextSelector.text = "Time to work:"
        mainTimer.invalidate()
        resetWorkTimer()
        updateUI()
        
        mainTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            if self.minutes == 0 && self.seconds == 0 {
                self.TextSelector.text = "Chill:"
                self.resetRelaxTimer()
            } else if self.seconds.self == 0 {
                self.minutes -= 1
                self.seconds = 59
                self.updateUI()
            } else {
                self.seconds -= 1
                let activeSecondsCounter = self.minutes * 60 + self.seconds
                print(1 - (Float(activeSecondsCounter) / 2698))
                self.timerProgress.progress = 1 - (Float(activeSecondsCounter) / Float(self.stableSecondsCounter))
                self.updateUI()
            }
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        TextSelector.text = "Press start button"
        mainTimer.invalidate()
        resetWorkTimer()
        updateUI()
    }
}
