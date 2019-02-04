//
//  ViewController.swift
//  alert
//
//  Created by chris on 2/3/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tree: UIImageView!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var time: UIButton!
    @IBOutlet weak var unlock: UIButton!
    @IBOutlet weak var menu: UIButton!
    
    var playButtonCenter: CGPoint!
    var timeButtonCenter: CGPoint!
    var unlockButtonCenter: CGPoint!
    
    var menuPressed = 0
    var hour = 0
    var numOfUnlocks = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //change alpha
        play.alpha = 0
        time.alpha = 0
        unlock.alpha = 0
        
        //initialize center variables with coordinates of the expanded buttons
        playButtonCenter = play.center
        timeButtonCenter = time.center
        unlockButtonCenter = unlock.center
        
        //place play, time, unlock button at the position of the menu button
        play.center = menu.center
        time.center = menu.center
        unlock.center = menu.center
    }
    
    @IBAction func menuPressed(_ sender: UIButton) {
        
        if menuPressed == 0{
            //expand buttons
            UIView.animate(withDuration: 0.3, animations: {
                //change alpha
                self.play.alpha = 1
                self.time.alpha = 1
                self.unlock.alpha = 1
                
                //animations
                self.play.center = self.playButtonCenter
                self.time.center = self.timeButtonCenter
                self.unlock.center = self.unlockButtonCenter
                
                //rotate menu button
                self.menu.transform = self.menu.transform.rotated(by: CGFloat(Double.pi))
            })
            
            menuPressed = 1
        }
        else{
            //collapse buttons
            UIView.animate(withDuration: 0.3, animations: {
                //change alpha
                self.play.alpha = 0
                self.time.alpha = 0
                self.unlock.alpha = 0
                
                //animations
                self.play.center = self.menu.center
                self.time.center = self.menu.center
                self.unlock.center = self.menu.center

                //rotate menu button
                self.menu.transform = self.menu.transform.rotated(by: -CGFloat(Double.pi))
            })
            
            menuPressed = 0
        }
    }//closing bracket of menu pressed
    
    @IBAction func timeButton(_ sender: UIButton) {
        askForInput(title: "Time", message: "Enter ", defaultText: "Enter a number")
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
    }
    
    
    @IBAction func unlockButton(_ sender: Any) {
        askForInput(title: "Unlocks", message: "Enter maximum number of unlocks for today", defaultText: "Enter a number")
    }
    
    func askForInput(title: String, message: String, defaultText: String){
        //1. Create the alert controller.
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.keyboardType = UIKeyboardType.numberPad
            textField.placeholder = defaultText
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.hour = Int((textField?.text)!)!
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
}

