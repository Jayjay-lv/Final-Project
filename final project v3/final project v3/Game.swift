//
//  Game.swift
//  final project v3
//
//  Created by jayjay venegas on 5/12/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import Foundation


class MatchingGame {
    var cards:[Card] = [Card]()
    var cardsFlipped:[Card] = [Card]()
    var isPlaying: Bool = false
    
    
    
    
    
    func shuffledeck(cards:[Card]) -> [Card] {
        var randomize = cards
        randomize.shuffle()
        
        
        return randomize
    }
    
    func newGame(cardsArray: [Card]) -> [Card] {
        cards = shuffledeck(cards: cardsArray)
        isPlaying = true
        
        return cardsArray
    }
    
    
    func restart() {
        isPlaying = false
        cards.removeAll()
        cardsFlipped.removeAll()
    }
    
    
    func cardIndex(_ index: Int) -> Card? {
        if cards.count > index {
            return cards[index]
        } else {
            return nil
        }
    }
    
    func indexCard(_ card: Card) -> Int? {
        for index in 0...cards.count-1 {
            if card === cards[index] {
                return index
            }
        }
        return nil
    }
    
    
    func notMatchedCardFlipped() -> Bool {
        return cardsFlipped.count % 2 != 0
    }
    
    
    func notmatchedCard() -> Card? {
        let notmatched = cardsFlipped.last
        
        return notmatched
    }
    
    
    func didtouch(_ card: Card?) {
        guard let card = card else {
            return
        }
        if notMatchedCardFlipped() {
            let wrongCard = notmatchedCard()!
            
            
            if card.equals(wrongCard) {
                cardsFlipped.append(card)
            } else {
                let secondCard = cardsFlipped.removeLast()
            }
            
        } else {
            cardsFlipped.append(card)
        }
        
        if cardsFlipped.count == cards.count {
            end()
        }
    }
    
    
    
}
