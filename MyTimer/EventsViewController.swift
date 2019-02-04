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

    @IBAction func addEventAction(_ sender: Any) {
        print("hello!!")
        
        let alertController = UIAlertController(title: "Enter your event:", message: nil, preferredStyle: .alert)
        
        //Textfield to enter!! This part I need to study
        alertController.addTextField(configurationHandler: { (_ textField: UITextField) -> Void in textField.placeholder = "Writing codes/Make dinner/Do chor...   "
            textField.textAlignment = .center
            textField.textColor = UIColor.black
        })
        
        //Create action to the Textfield. cancelAction is understandable
        //okAction I need to study!
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ -> Void in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let timerVC = storyBoard.instantiateViewController(withIdentifier: "TimerNav")
            self.present(timerVC, animated: true, completion: nil)
        })
        
        //Add action to alertController. Yes
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        //present! Yes
        self.present(alertController, animated: true, completion: nil)
    }
}

