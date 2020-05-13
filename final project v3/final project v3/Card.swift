//
//  Card.swift
//  final project v3
//
//  Created by jayjay venegas on 5/12/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import Foundation


class Card {
    var id: String
    var shown: Bool = false
    var picture: UIIMage!


init(image: UIImage) {
    self.id = NSUUID().uuidString
    self.shown = false
    self.picture = image
}


func equals(_ card: Card) -> Bool {
    return (card.id == id)
}

func copy() -> Card {
    return Card(card: self)
}
    
    init(card: Card) {
        self.id = card.id
        self.shown = card.shown
        self.picture = card.picture
    }
    
    
    extension Array {
        mutating func shuffle() {
            for _ in 0..self.count {
                sort {(_,_) in arc4random() < arc4random() }
            }
        }
    }
    
    
}
