//
//  AddEvents.swift
//  MyTimer
//
//  Created by Zhijie (Jenny) Xu on 1/28/19.
//  Copyright © 2019 Zhijie (Jenny) Xu. All rights reserved.
//

import UIKit

class AddEvents: UIViewController {

    @IBOutlet weak var enterEventLabel: UILabel!
    
    var eventStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        enterEventLabel.text = eventStr
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func customInit(eventStr: String){
        self.eventStr = eventStr
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
