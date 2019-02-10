//
//  EventsViewController.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 1/28/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            self.performSegue(withIdentifier: "passEventName", sender: self)
            print(self.eventName + " + after prepare func")
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
    
}

