//
//  MetadataViewController.swift
//  alert
//
//  Created by chris on 2/6/19.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class MetadataViewController: UIViewController {
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //allow label round corners
        TimeLabel.layer.masksToBounds = true
        
        print()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel), name: NSNotification.Name(rawValue: "update"), object: nil)
    }
    
    @objc func updateLabel() {
        print()
    }

    func print(){
        if Global.h == 0 && Global.m == 0 {
            TimeLabel.text = "\(Global.s) secs"
        }
        else if Global.h == 0 && Global.s == 0 {
            TimeLabel.text = "\(Global.m) mins"
        }
        else if Global.m == 0 && Global.s == 0 {
            TimeLabel.text = "\(Global.h) hrs"
        }
        else if Global.h == 0 {
            TimeLabel.text = "\(Global.m) mins \(Global.s) secs"
        }
        else if Global.m == 0{
            TimeLabel.text = "\(Global.h) hrs \(Global.s) secs"
        }
        else if Global.s == 0{
            TimeLabel.text = "\(Global.h) hrs \(Global.m) mins"
        }
        else{
            TimeLabel.text = "\(Global.h) hrs \(Global.m) mins \(Global.s) secs"
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
