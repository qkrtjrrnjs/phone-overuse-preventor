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
                
                //change alpha value to 1
                self.setAlpha(alphaValue: 1)
                
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
                
                //change alpha value to 0
                self.setAlpha(alphaValue: 0)
                
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
    
    func setAlpha(alphaValue: Int){
        play.alpha = 0
        time.alpha = 0
        unlock.alpha = 0
    }
    
    @IBAction func timeButton(_ sender: UIButton) {

    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
    }
    
    
    @IBAction func unlockButton(_ sender: Any) {
        
    }
    
}

