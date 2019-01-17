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
//if a timer goes to a certain number, entire timer changes color


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: BounceButton!
    @IBOutlet weak var pauseButton: BounceButton!
    @IBOutlet weak var resetButton: BounceButton!
    
    
    var timer = Timer()
    var counter = 0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "00:00:00"
        self.startButton.isEnabled = true
        self.pauseButton.isEnabled = false
    }
    
    @IBAction func startButtonTapped(_ sender: BounceButton) {
        if(isRunning) {
            return
        }
        self.startButton.isEnabled = false
        self.pauseButton.isEnabled = true
        self.resetButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        // changes the opacity of the startButton when tapped
        sender.flash()
    }

    
    @IBAction func pauseButtonTapped(_ sender: BounceButton) {
        if(isRunning) {
            return
        }
        self.pauseButton.isEnabled = false
        self.startButton.isEnabled = true
        self.resetButton.isEnabled = true
            
        timer.invalidate()
        
        // changes the opacity of the pauseButton when tapped
        sender.flash()
        
    }

    @IBAction func resetButtonTapped(_ sender: BounceButton) {
        if(isRunning) {
            return
        }
        timer.invalidate()
        counter = 0
        timeLabel.text = "00:00:00"
        self.startButton.isEnabled = true
        self.pauseButton.isEnabled = false
        self.resetButton.isEnabled = false
        
        // shakes the resetButton when tapped
        sender.shake()
    }
//format the time string and interval
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
//testing
