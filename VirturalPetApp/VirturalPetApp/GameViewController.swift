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
    
    var newCreature = Monster(happiness: 8, hunger: 8)
    
    let tenMinutesFromNow =  10
    let twentyMinutesFromNow =  20
    let thirtyMinutesFromNow =  30
    let fortyMinutesFromNow =  40
    let fiftyMinutesFromNow =  50
    let sixtyMinutesFromNow = 0
    
    var currentDate = Date()
    var userCalendar = Calendar.current
    var useDateComponents = DateComponents()
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let minutes = userCalendar.component(.minute, from: currentDate)
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
        
    }
    
    func timeCheck() {
        
        switch minutes {
            
            
        case tenMinutesFromNow:
            
            print("I have pooed once")
            
        case twentyMinutesFromNow:
            
            print("I have pooed twice")
            
        case thirtyMinutesFromNow:
            
            print("I have pooed thrice")
            
        case fortyMinutesFromNow:
            
            print("I have pooed four times")
            
        case fiftyMinutesFromNow:
            
            print("I have pooed 5 times")
            
        default:
            
            print("I am thinking about pooing soon")
            
            
        }

    }
    
    
    
    // IBOutlets for UI labels - 8 Happiness etc
    @IBOutlet weak var happinessMeter: UILabel!
    @IBOutlet weak var hungerMeter: UILabel!
    
    
    // Button action to pat the creature
    @IBAction func patBtn(_ sender: UIButton) {
        if newCreature.hunger < 8 {
            newCreature.happiness += 1
            happinessMeter.text = "\(newCreature.happiness)"
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
