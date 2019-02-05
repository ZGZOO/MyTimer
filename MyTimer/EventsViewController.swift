//
//  EventsViewController.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 1/28/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    var eventName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addEventAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Enter your event:", message: nil, preferredStyle: .alert)
        
        //Textfield to enter!! This part I need to study
        alertController.addTextField(configurationHandler: { (_ textField: UITextField) -> Void in textField.placeholder = "Writing codes/Make dinner/Do chor...   "
            textField.textAlignment = .center
            textField.textColor = UIColor.black
            
//            func prepareForSegue(segue: UIStoryboardSegue, sender:  AnyObject?){
//                let nextVC : TimerViewController = segue.destination as! TimerViewController
//                nextVC.nextVCData = self.eventName
//            }
        })
        
        //Create action to the Textfield. cancelAction is understandable
        //okAction I need to study!
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ -> Void in
            
//            self.eventName = alertController.textFields![0].text!
            //print(self.eventName)
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let viewControllerB = segue.destination as? TimerViewController {
//                    viewControllerB.nextVCData = self.eventName
                    viewControllerB.nextVCData = alertController.textFields![0].text!
                }
            }
//            let nextVC = TimerViewController()
//            nextVC.nextVCData = self.eventName
            
//            func prepareForSegue(segue: UIStoryboardSegue, sender:  AnyObject?){
//                let nextVC : TimerViewController = segue.destination as! TimerViewController
//                nextVC.nextVCData = self.eventName
//            }
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let timerVC = storyBoard.instantiateViewController(withIdentifier: "TimerNav")
            self.present(timerVC, animated: true, completion: nil)
            
        })
        
//                    func prepareForSegue(segue: UIStoryboardSegue, sender:  AnyObject?){
//                        let nextVC : TimerViewController = segue.destination as! TimerViewController
//                        nextVC.nextVCData = self.eventName
//                    }
        
        //Add action to alertController. Yes
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        //present! Yes
        self.present(alertController, animated: true, completion: nil)
    }
}

