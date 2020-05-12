//
//  GameManager.swift
//  Snake
//
//  Created by jayjay venegas on 4/15/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import Foundation
import SpriteKit



class GameManager{
    /*
    enum Direction{
        case left
        case up
        case right
        case down
    }
 */
    
    var scene: GameScene!
    var nextTime: Double?
    var timeExtension: Double = 0.15
    var playerDirection: Int = 4
    var currentScore: Int = 0
    
    
    init(scene: GameScene) {
        self.scene = scene
        
    }
    
    func initGame() {
       
        
     
    }

 
    

    func update(time: Double) {
        if nextTime == nil {
            nextTime = time + timeExtension
        } else {
            if time >= nextTime! {
                nextTime = time + timeExtension
            }
        }
    }
   
  
    
  
}
