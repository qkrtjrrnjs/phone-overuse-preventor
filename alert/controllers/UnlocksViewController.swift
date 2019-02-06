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
        
        //setting placeholder text and its font
        unlocksTextField.attributedPlaceholder = NSAttributedString(string: "number of unlocks", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont(name: "Gill Sans", size: 16)!
            ])
        
        unlocksTextField.keyboardType = UIKeyboardType.numberPad
        unlocksTextField.becomeFirstResponder()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if (unlocksTextField.text?.isEmpty)!{
            let alert = UIAlertController(title: "ERROR", message: "Empty input!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            Global.unlocks = Int(unlocksTextField.text!)!
            dismiss(animated: true, completion: nil)
        }
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
