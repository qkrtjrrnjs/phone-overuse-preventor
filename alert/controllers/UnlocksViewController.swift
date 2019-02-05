//
//  UnlocksViewController.swift
//  alert
//
//  Created by chris on 2/4/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class UnlocksViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unlocksTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unlocksTextField.attributedPlaceholder = NSAttributedString(string: "number of unlocks", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name: "Gill Sans", size: 16)!
            ])
        
        //unlocksTextField.placeholder = "number of unlocks"
        unlocksTextField.keyboardType = UIKeyboardType.numberPad
        
        
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
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
