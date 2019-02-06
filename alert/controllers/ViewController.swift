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
    @IBOutlet weak var pause: UIButton!
    
    var playButtonCenter: CGPoint!
    var timeButtonCenter: CGPoint!
    var unlockButtonCenter: CGPoint!
    var pauseButtonCenter: CGPoint!
    
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
        pauseButtonCenter = pause.center
        
        //place play, time, unlock button at the position of the menu button
        play.center = menu.center
        time.center = menu.center
        unlock.center = menu.center
        pause.center = menu.center
        
        //hide and disable pause button
        pause.isEnabled = false
        pause.isHidden = true
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
                self.pause.center = self.pauseButtonCenter
                
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
                self.pause.center = self.menu.center

                //rotate menu button
                self.menu.transform = self.menu.transform.rotated(by: -CGFloat(Double.pi))
            })
            
            menuPressed = 0
        }
    }//closing bracket of menu pressed
    
    func setAlpha(alphaValue: Int){
        play.alpha = CGFloat(alphaValue)
        time.alpha = CGFloat(alphaValue)
        unlock.alpha = CGFloat(alphaValue)
        pause.alpha = CGFloat(alphaValue)
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        Global.timer.invalidate()
        
        sender.isEnabled = false
        sender.isHidden = true
        play.isEnabled = true
        play.isHidden = false
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        if Global.seconds == 0 {
            let alert = UIAlertController(title: "ERROR", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            runTimer()
            sender.isEnabled = false
            sender.isHidden = true
            pause.isEnabled = true
            pause.isHidden = false
        }
    }
    
    func runTimer() {
        Global.timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        Global.seconds-=1
        (Global.h, Global.m, Global.s) = secondsToHoursMinutesSeconds(seconds: Global.seconds)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "update"), object: nil)
        print(Global.seconds)
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }

    
}



