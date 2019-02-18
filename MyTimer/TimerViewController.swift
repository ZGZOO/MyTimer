//
//  TimerViewController.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 2/3/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        eventLabel.text = eventTitle
        
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
    
    var hr : String!
    var min : String!
    var sec : String!
    var ms : String!
    var hrShow : String!
    var minShow : String!
    var secShow : String!
    
    @objc func timeCounter() {
        duration = fixedDuration + Date.init().timeIntervalSince(timeStartsAt)
   
        let hour = (Int)(fmod((duration/3600), 60))
        let minute = (Int)(fmod((duration/60), 60))
        let second = (Int)(fmod(duration, 60))
        let msec = (Int)((duration - floor(duration))*100)
        
        if hour < 10 {
            hr = "0" + String(format:"%01d", hour)
            hrShow = String(format:"%01d", hour)
        }else{
            hr = String(format:"%02d", hour)
            hrShow = String(format:"%01d", hour)
        }
        
        if minute < 10 {
            min = "0" + String(format:"%01d", minute)
            minShow = String(format:"%01d", minute)
        }else{
            min = String(format:"%02d", minute)
            minShow = String(format:"%01d", minute)
        }
        
        if second < 10 {
            sec = "0" + String(format:"%01d", second)
            secShow = String(format:"%01d", second)
        }else{
            sec = String(format:"%02d", second)
            secShow = String(format:"%01d", second)
        }
        
        ms = String(format:"%02d", msec)
        
        hourLabel.text = hr
        minuteLabel.text = min
        secondLabel.text = sec
        milisecLabel.text = ms
    }
    
    var todayDate : String!
    
    @IBAction func stopPressed(_ sender: Any) {
        scheduleTimer.invalidate()
        startButton.setTitle("Start", for: .normal)
        startNotRuns = false
    
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
//        formatter.dateFormat = "MMMM dd, yyyy"
        todayDate = formatter.string(from: date)
        
        if hr != "00" {
            arrayContent = todayDate + ": " + hrShow + " hrs " + minShow + " mins " + secShow + " secs." + ms
        }else if min != "00" {
            arrayContent = todayDate + ": " + minShow + " mins " + secShow + " secs." + ms
        }else if sec != "00" {
            arrayContent = todayDate + ": " + secShow + "." + ms + " secs"
        }else {
            arrayContent = todayDate + ": " + "0." + ms + " secs"
        }

        durationArray.insert(self.arrayContent!,at: durationArray.count)
        UserDefaults.standard.set(durationArray, forKey: "DurationArray")
        let indexPath = IndexPath(row: 0, section: 0)
        durationsTable.beginUpdates()
        durationsTable.insertRows(at: [indexPath], with: .automatic)
        durationsTable.endUpdates()
        durationsTable.reloadData()
        
        duration = 0.0
        fixedDuration = 0.0
    }
    
    //coommented it for now. Need it if want to keep the history on the screen
    
//    override func viewDidAppear(_ animated: Bool) {
//        durationArray.removeAll()
//        durationsTable.reloadData()
//        if let array = UserDefaults.standard.object(forKey: "DurationArray") as? [String]{
//            print(array)
//            durationArray = array
//            durationsTable.reloadData()
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Your each duration"
    }
    
    //no reaction?? //commented it out for now
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 1200
//    }
    
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
