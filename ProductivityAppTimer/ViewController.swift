//
//  ViewController.swift
//  ProductivityAppTimer
//
//  Created by Nikita Kotlyarevskiy on 20.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    var minutes = 0
    var seconds = 0
    
    override func viewDidLoad() {
        resetTimer()
        updateUI()
    }

    func resetTimer() {
        minutes = 45
        seconds = 0
        timerProgress.progress = 0
    }

    func updateUI() {
        var minutesString = String(format: "%02d", minutes)
        var secondsString = String(format: "%02d", seconds)
        timer.text = "\(minutesString):\(secondsString)"
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        resetTimer()
        updateUI()
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            if seconds.self == 0 {
                minutes -= 1
                seconds = 59
                updateUI()
            } else {
                seconds -= 1
                updateUI()
            }
        }
        var progressCount = Float(minutes)
        timerProgress.progress = 0.0 - progressCount
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetTimer()
        updateUI()
    }
    
}

// DEBUG: Многократное нажатие на клопку старт разгоняет таймер
// TODO: реализовать функционал timerProgress'а
