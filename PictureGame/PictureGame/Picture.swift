//
//  Picture.swift
//  PictureGame
//
//  Created by jayjay venegas on 5/11/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import SpriteKit

class Picture: SKSpriteNode {


    init() {
        let texture = SKTexture(imageNamed: "picture")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        zPosition = 1
        anchorPoint = CGPoint(x: 0, y: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    
    }
   
}
