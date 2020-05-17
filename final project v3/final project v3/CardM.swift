//
//  CardM.swift
//  final project v3
//
//  Created by jayjay venegas on 5/17/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import Foundation


class CardM {
    
    func getCards() -> [Card] {
        
        var generatedArray = [Card]()
        
        for i in 1...8 {
            
            let randomNumber = arc4random_uniform(13) + (1)
            print(randomNumber)
            
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            
            generatedArray.append(cardOne)
            
            
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedArray.append(cardTwo)
            
        }
        
        return generatedArray
    }
    
    
}
