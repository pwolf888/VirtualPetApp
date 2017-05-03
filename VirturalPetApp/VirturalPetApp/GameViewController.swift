//
//  GameViewController.swift
//  VirturalPetApp
//
//  Created by Jonathan Turnbull on 27/04/2017.
//  Copyright © 2017 partywolfAPPS. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    var timerSeconds = 0
    let timerSecondsMax = 59
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
    
    
    
    var newCreature = Monster(happiness: 8, hunger: 8)
    
    let tenMinutesFromNow =  10
    let twentyMinutesFromNow =  20
    let thirtyMinutesFromNow =  30
    let fortyMinutesFromNow =  40
    let fiftyMinutesFromNow =  50
    let sixtyMinutesFromNow = 0
    
    var currentDate = Date()
    var userCalendar = Calendar.current
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
       
            runTimer()
        
    }
    
    func timeUpdate() {
        //
    }
    
    
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        
       
    }
    
    func updateTimer() {
        if timerSeconds == 59 {
            timerSeconds = 0
            timerLabel.text = "\(timerSeconds)"
        } else {
            timerSeconds += 1
            timerLabel.text = "\(timerSeconds)"
        }
        
        if timerSeconds % 10 <= 1 {
            timeCheck()
        }
        
    }
    
    func timeCheck() {
        
        switch timerSeconds {
            
        case tenMinutesFromNow:
            unhappyHungry()
            print("I have pooed once")
            
        case twentyMinutesFromNow:
            unhappyHungry()
            print("I have pooed twice")
            
        case thirtyMinutesFromNow:
            unhappyHungry()
            print("I have pooed thrice")
            
        case fortyMinutesFromNow:
            unhappyHungry()
            print("I have pooed four times")
            
        case fiftyMinutesFromNow:
            unhappyHungry()
            print("I have pooed 5 times")
            
        default:
            
            print("I am thinking about pooing soon")
            
            
            
        }

    }
    
    // A function to reduce the happiness and hunger variables
    func unhappyHungry() {
        newCreature.happiness -= 1
        newCreature.hunger -= 1
        happinessMeter.text = "\(newCreature.happiness)"
        hungerMeter.text = "\(newCreature.hunger)"
    }
    
    
    // IBOutlets for UI labels - 8 Happiness etc
    @IBOutlet weak var happinessMeter: UILabel!
    @IBOutlet weak var hungerMeter: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    // Button action to pat the creature
    @IBAction func patBtn(_ sender: UIButton) {
        if newCreature.hunger < 8 {
            newCreature.happiness += 1
            happinessMeter.text = "\(newCreature.happiness)"
            timeCheck()
            
        }
    }
    
    // Button action to feed the creature
    @IBAction func feedBtn(_ sender: UIButton) {
        if newCreature.hunger < 8 {
            newCreature.hunger += 1
            hungerMeter.text = "\(newCreature.hunger)"
        }
    }
    
    
    
    
    
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
