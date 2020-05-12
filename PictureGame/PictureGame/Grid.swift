//
//  Grid.swift
//  PictureGame
//
//  Created by jayjay venegas on 5/11/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import SpriteKit

class Grid: SKSpriteNode {
    let rows = 8
    let columns = 10

    var cellWidth = 0
    var cellHeight = 0

    
    var gridArray = [[Picture]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        let touch = touches.first!
        let location = touch.location(in: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

            isUserInteractionEnabled = true

            cellWidth = Int(size.width) / columns
        cellHeight = Int(size.height) / rows
        
        populateGrid()

    }
    
    func populateGrid() {
      for gridX in 0..<columns {
          gridArray.append([])
          for gridY in 0..<rows {

              addPictureAtGrid(x:gridX, y:gridY)
          }
      }
        
    }
    func addPictureAtGrid(x: Int, y: Int) {
        let picture = Picture()
        let gridPosition = CGPoint(x: x*cellWidth, y: y*cellWidth)
        picture.position = gridPosition
        
      //  picture.isMatched = true

        addChild(picture)

        gridArray[x].append(picture)
    }
}
