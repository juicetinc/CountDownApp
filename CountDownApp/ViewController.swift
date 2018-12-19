//
//  ViewController.swift
//  CountDownApp
//
//  Created by Justin Celeste on 9/19/18.
//  Copyright © 2018 Justin Celeste. All rights reserved.
//this is active branch
//try to add more to the UI
// improve the UI buttons, add buttons,
// add a firstimer, second timer,
//if a tiemr goes to a certain number, entire timer changes color


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    var timer = Timer()
    var counter = 0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "\(counter)"
        self.startButton.isEnabled = true
        self.pauseButton.isEnabled = false
    }

    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if(isRunning) {
            return
        }
        self.startButton.isEnabled = false
        self.pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }

    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        self.pauseButton.isEnabled = true
        self.startButton.isEnabled = true
        timer.invalidate()
        
        
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        counter = 0
        timeLabel.text = String(counter)
        self.startButton.isEnabled = true
        
    }
    
    func timeString(time:TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    
    @objc func updateTimer() {
        counter += 1
        timeLabel.text = timeString(time:TimeInterval(counter))
    
    }
}
