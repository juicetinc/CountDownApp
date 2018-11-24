//
//  ViewController.swift
//  CountDownApp
//
//  Created by Justin Celeste on 9/19/18.
//  Copyright © 2018 Justin Celeste. All rights reserved.
//this is active branch
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    var timer = Timer()
    var counter = 0.0
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
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        self.pauseButton.isEnabled = true
        self.startButton.isEnabled = true
        timer.invalidate()
        
        
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        counter = 0.0
        timeLabel.text = String(counter)
        self.startButton.isEnabled = true
        
    }
    
    @objc func updateTimer() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    
    }
}
