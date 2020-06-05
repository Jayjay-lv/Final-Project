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
        
        var generatedNumbersArray = [Int]()
        var generatedArray = [Card]()
        
        while generatedNumbersArray.count < 8 {
            
            
            let randomNumber = arc4random_uniform(13) + (1)
            
            
            
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                print(randomNumber)
                
                generatedNumbersArray.append(Int(randomNumber))
                
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                generatedArray.append(cardOne)
                
                
                
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedArray.append(cardTwo)
                
            }
            
            
            
        }
        for i in 0...generatedArray.count-1 {
            let randomNumber = Int(arc4random_uniform(UInt32(generatedArray.count)))
            
            let tempStorage = generatedArray[0]
            generatedArray[0] = generatedArray[randomNumber]
            generatedArray[randomNumber] = tempStorage
            
            
            
        }
        
        return generatedArray
        
    }
}
