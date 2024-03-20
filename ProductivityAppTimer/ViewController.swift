//
//  ViewController.swift
//  ProductivityAppTimer
//
//  Created by Nikita Kotlyarevskiy on 20.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var mainTimer = Timer()
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    var minutes = 0
    var seconds = 0
    
    override func viewDidLoad() {
        resetTimer()
        updateUI()
    }

    func resetTimer() {
        minutes = 1
        seconds = 0
        timerProgress.progress = 0
    }

    func updateUI() {
        let minutesString = String(format: "%02d", minutes)
        let secondsString = String(format: "%02d", seconds)
        timer.text = "\(minutesString):\(secondsString)"
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        mainTimer.invalidate()
        resetTimer()
        updateUI()
        
        mainTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.minutes == 0 && self.seconds == 0 {
                self.mainTimer.invalidate()
            } else if self.seconds.self == 0 {
                self.minutes -= 1
                self.seconds = 59
                self.updateUI()
            } else {
                self.seconds -= 1
                self.updateUI()
            }
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        mainTimer.invalidate()
        resetTimer()
        updateUI()
    }
    
}

// TODO: реализовать функционал timerProgress'а
