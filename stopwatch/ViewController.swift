//
//  ViewController.swift
//  stopwatch
//
//  Created by Sayed Abdo on 3/8/18.
//  Copyright © 2018 sayedAbdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultlabel: UILabel!
    
    @IBOutlet weak var reserbtn: UIButton!
    
    @IBOutlet weak var startbtn: UIButton!
    @IBOutlet weak var endbtn: UIButton!
    
    var lableNumber:Double = 0
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startbtn.isEnabled = true
        endbtn.isEnabled = false
        reserbtn.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func startbtn(_ sender: Any) {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            self.lableNumber = self.lableNumber + 0.1
            self.resultlabel.text = String(format: "%.1f", self.lableNumber)
        }
        self.timer.fire()
        
        
        startbtn.isEnabled = false
        endbtn.isEnabled = true
        reserbtn.isEnabled = true
    }
    
    @IBAction func endbtn(_ sender: Any) {
        guard let timerForDistory = self.timer
            else {return}
        timerForDistory.invalidate()
        
        startbtn.isEnabled = true
        endbtn.isEnabled = false
        reserbtn.isEnabled = true
    }
    
    @IBAction func reserbtn(_ sender: Any) {
        
        guard let timerForDistory = self.timer
            else {return}
        timerForDistory.invalidate()
        self.lableNumber = 0
        self.resultlabel.text = "0.0"
        
        startbtn.isEnabled = true
        endbtn.isEnabled = false
        reserbtn.isEnabled = false
        
    }
}

