//
//  GameScene.swift
//  Snake
//
//  Created by jayjay venegas on 4/15/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to: SKView) {
        if let grid = Grid(blockSize: 40.0, rows:5, cols:5) {
            grid.position = CGPoint (x:frame.midX, y:frame.midY)
            addChild(grid)

            let gamePiece = SKSpriteNode(imageNamed: "Spaceship")
            gamePiece.setScale(0.0625)
            gamePiece.position = grid.gridPosition(row: 1, col: 0)
            grid.addChild(gamePiece)
        }
    }
}
