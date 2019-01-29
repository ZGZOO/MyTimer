//
//  EventsViewController.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 1/28/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    var eventTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func addEventTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter your event", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: eventTextFieldFunc)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: self.okHandlerFunc)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func eventTextFieldFunc(textField: UITextField){
        eventTextField = textField
        eventTextField?.placeholder = "Writing codes/Make dinner/Do chor..."
    }
    
    func okHandlerFunc(alert: UIAlertAction){
        let addEventsVC = AddEvents()
        addEventsVC.customInit(eventStr: (eventTextField?.text)!)
        self.navigationController?.pushViewController(addEventsVC, animated: true)
    }
}

