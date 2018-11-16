//
//  ViewController.swift
//  CountDownApp
//
//  Created by Justin Celeste on 9/19/18.
//  Copyright © 2018 Justin Celeste. All rights reserved.
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
    
    @IBAction func startButton(_ sender: Any) {
        if(isRunning) {
            return
        }
        self.startButton.isEnabled = false
        self.pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #Selector(updateTimer), userInfo: nil, repeats: true)
    
        }
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: Any) {
        self.startButton.isEnabled = false
        self.pauseButton.isEnabled = true
        
        timer.invalidate()
        isRunning = true
        
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        self.resetButton.isEnabled = true
        self.startButton.isEnabled = true
        
        
    }
    
 
    @objc func updateTimer() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    
        
    }


}
