//
//  EventsViewController.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 1/28/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var eventsTable: UITableView!
    
    private var eventNames : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        eventNames.removeAll()
        self.eventsTable.dataSource = self
    }

    var eventName : String = ""
    
    @IBAction func addEventAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Enter your event:", message: nil, preferredStyle: .alert)
        
        //Textfield to enter!! This part I need to study
        alertController.addTextField(configurationHandler: { (_ textField: UITextField) -> Void in textField.placeholder = "Writing codes/Make dinner/Do chor...   "
            textField.textAlignment = .center
            textField.textColor = UIColor.black
        })
        
        //Create action to the Textfield. cancelAction is understandable
        //okAction I need to study!
        //spent a LOT of time get the title pass through VC, a good lesson
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ -> Void in
            self.eventName = alertController.textFields![0].text!
            self.insertEventName()
            self.performSegue(withIdentifier: "passEventName", sender: self)
        })
        
        //Add action to alertController. Yes
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        //present! Yes
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "passEventName"){
            let timeVC = segue.destination as! TimerViewController
            timeVC.eventTitle = eventName
        }
    }
    
    func insertEventName(){
        eventNames.insert(self.eventName,at: eventNames.count)
        UserDefaults.standard.set(eventNames, forKey: "EventArray")
        let indexPath = IndexPath(row: 0, section: 0)
        eventsTable.beginUpdates()
        eventsTable.insertRows(at: [indexPath], with: .automatic)
        eventsTable.endUpdates()
        eventsTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let array = UserDefaults.standard.object(forKey: "EventArray") as? [String]{
            print(array)
            eventNames = array
            eventsTable.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventsTableViewCell")
        let text = self.eventNames[indexPath.row]
        cell?.textLabel?.text = text
        return cell!
    }
    
}

