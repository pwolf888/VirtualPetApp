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
    }
    
    // IBOutlets for UI labels - 8 Happiness etc
    @IBOutlet weak var happinessMeter: UILabel!
    @IBOutlet weak var hungerMeter: UILabel!
   
    
    
    @IBAction func patBtn(_ sender: UIButton) {
        if newCreature.hunger < 8 {
            newCreature.happiness += 1
            happinessMeter.text = "\(newCreature.happiness)"
        }
    }
    
    
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
