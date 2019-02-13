//
//  TimerViewController.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 2/3/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var milisecLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var durationsTable: UITableView!
    
    var timeStartsAt = Date.init()
    var timeEndsAt = Date.init()
    var scheduleTimer = Timer()
    var duration = 0.0
    var fixedDuration = 0.0
    
    var eventTitle: String?
    
    var durationArray : [String] = []
    var arrayContent : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourLabel.text = "00"
        minuteLabel.text = "00"
        secondLabel.text = "00"
        milisecLabel.text = "00"
        print(eventTitle ?? "no value still" + " + before assign in Timer")
        eventLabel.text = eventTitle
        print(eventTitle ?? "no value still" + " + after assign in Timer")
        
        self.durationsTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    var startNotRuns = false
    
    @IBAction func startPressed(_ sender: UIButton) {
        if !startNotRuns {
            startButton.setTitle("Pause", for: .normal)
            timeStartsAt = Date.init()
            timeCounter()
            scheduleTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.timeCounter), userInfo: nil, repeats: true)
            startNotRuns = true
        }else{
            scheduleTimer.invalidate()
            timeEndsAt = Date.init()
            fixedDuration += timeEndsAt.timeIntervalSince(timeStartsAt)
            startButton.setTitle("Start", for: .normal)
            startNotRuns = false
        }
    }
    
    @objc func timeCounter() {
        duration = fixedDuration + Date.init().timeIntervalSince(timeStartsAt)
   
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
    
    @IBAction func stopPressed(_ sender: Any) {
        scheduleTimer.invalidate()
        startButton.setTitle("Start", for: .normal)
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
//        formatter.dateFormat = "MMMM dd, yyyy"
        arrayContent = formatter.string(from: date) + "\nhello"
        durationArray.insert(self.arrayContent!,at: durationArray.count)
        UserDefaults.standard.set(durationArray, forKey: "DurationArray")
        let indexPath = IndexPath(row: 0, section: 0)
        durationsTable.beginUpdates()
        durationsTable.insertRows(at: [indexPath], with: .automatic)
        durationsTable.endUpdates()
        durationsTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let array = UserDefaults.standard.object(forKey: "DurationArray") as? [String]{
            print(array)
            durationArray = array
            durationsTable.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.durationArray.count
    }
    
    //still can't type in mind
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "durationCell")
        let text = self.durationArray[indexPath.row]
        cell?.textLabel?.text = text
        return cell!
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
