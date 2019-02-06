//
//  TimeViewController.swift
//  alert
//
//  Created by chris on 2/4/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerPicker: UIDatePicker!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.countDownDuration = 60.0
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        Global.seconds = Int(timerPicker.countDownDuration)
        dismiss(animated: true, completion: nil)
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
