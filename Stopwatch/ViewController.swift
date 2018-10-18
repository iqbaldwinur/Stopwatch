//
//  ViewController.swift
//  Stopwatch
//
//  Created by Iqbal Dwi Nur Khoirul anam on 18/10/18.
//  Copyright © 2018 iqbal project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //membuat class timer
    var stopwatchTimer = Timer()
    var currentTime = 0
    
    

    @IBOutlet weak var MinuteLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var PauseButton: UIButton!
    
    
    
    
    @IBAction func hasStartButton(_ sender: Any) {
        
        StartButton.isHidden = true
        PauseButton.isHidden = false
        StopButton.isEnabled = true
        
        
        stopwatchTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: (#selector(ViewController.updateTime)), userInfo: nil, repeats: true)
    }
    
 
    
    
    @IBAction func hasStopButton(_ sender: Any) {
        
        PauseButton.isHidden = true
        StartButton.isHidden = false
        StopButton.isEnabled = false
        
        currentTime = 0
        MinuteLabel.text = "0"
         SecondLabel.text = "0"
        
        stopwatchTimer.invalidate()
        
        
    }
    @objc func updateTime(){
        currentTime += 1
        MinuteLabel.text = "\(currentTime / 60)"
        SecondLabel.text = "\(currentTime % 60)"
        
        if currentTime == 3600 {
            
            currentTime = 0
        }
    }
    
    @IBAction func hasPauseButton(_ sender: Any) {
        
        StartButton.isHidden = false
        PauseButton.isHidden = true
        
        stopwatchTimer.invalidate()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        PauseButton.isHidden = true
        StopButton.isEnabled = false
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

}

