//
//  TimerViewController.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 2/3/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var milisecLabel: UILabel!
    
    var timeStartsAt = Date.init()
    var scheduleTimer = Timer()
    var nextVCData: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourLabel.text = "00"
        minuteLabel.text = "00"
        secondLabel.text = "00"
        milisecLabel.text = "00"
//        print(nextVCData as Any)
        eventName.text = nextVCData
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        timeStartsAt = Date.init()
        timeCounter()
        scheduleTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.timeCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func timeCounter() {
        
        let duration = Date.init().timeIntervalSince(timeStartsAt)
   
        let hour = (Int)(fmod((duration/3600), 60))
        let minute = (Int)(fmod((duration/60), 60))
        
        let second = (Int)(fmod(duration, 60))
        
        let msec = (Int)((duration - floor(duration))*100)
        
        let hr = String(format:"%02d", hour)
        let min = String(format:"%02d", minute)
        let sec = String(format:"%02d", second)
        let ms = String(format:"%02d", msec)
        
        hourLabel.text = hr
        minuteLabel.text = min
        secondLabel.text = sec
        milisecLabel.text = ms
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
