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
    

    var game: GameManager!

    var gameBG: SKShapeNode!
    var gameArray: [(node: SKShapeNode, x: Int, y: Int)] = []
    
    
 
    override func didMove(to view: SKView) {
        game = GameManager(scene:self)
        
      initializeGameView()
    }
    
    
    private func initializeGameView() {
        
        let width = Int(frame.size.width - 200)
        let height = Int(frame.size.height - 300)
        let rect = CGRect(x: -width / 2, y: -height / 2, width: width, height: height)
        gameBG = SKShapeNode(rect: rect, cornerRadius: 0.02)
        gameBG.fillColor = SKColor.darkGray
        gameBG.zPosition = 2
        gameBG.isHidden = true
        self.addChild(gameBG)
        
        createGameBoard(width: Int(width), height: Int(height))
    }
    
    private func createGameBoard(width: Int, height: Int) {
        let cellWidth: CGFloat = CGFloat(width) / 5
        let cellHeight: CGFloat = CGFloat(height) / 10.0
        let numRows = 10
        let numCols = 5
        var x = CGFloat(width / -2) + (cellWidth / 2)
        var y = CGFloat(height / 2) - (cellWidth / 2)
        for i in 0...numRows - 1 {
            for j in 0...numCols - 1 {
                let cellNode = SKShapeNode(rectOf: CGSize(width: cellWidth, height: cellHeight))
                cellNode.strokeColor = SKColor.black
                cellNode.zPosition = 2
                cellNode.position = CGPoint(x: x, y: y)
                gameArray.append((node: cellNode, x: i, y: j))
                gameBG.addChild(cellNode)
                x += cellWidth
            }
            x = CGFloat(width / -2) + (cellWidth / 2)
            y -= cellWidth
        }
    }
  

}


