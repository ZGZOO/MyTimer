//
//  BeginningViewController.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 1/28/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import Foundation
import UIKit

class BeginningViewController: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    
    @IBAction func tapped(_ sender: Any) {
        navToMainNav()
    }
    
    private func navToMainNav(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let mainNavVC = mainStoryboard.instantiateViewController(withIdentifier: "MainNavController") as? MainNavController else{
            return
        }
        
        present(mainNavVC, animated: true, completion: nil)
    }
}
