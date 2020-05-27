//
//  ViewController.swift
//  final project v3
//
//  Created by jayjay venegas on 5/12/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var cardArray = [Card]()
    var model = CardM()
    var firstFlipIndex:IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        let card = cardArray[indexPath.row]
        
        cell.set(card)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false {
             cell.flipped()
            
            card.isFlipped = true
            
            if firstFlipIndex == nil {
                firstFlipIndex = indexPath
            }
            else {
                
                checkForMatch(indexPath)
            }
            
        }
        
        
    }
    
    func checkForMatch(_ secondFlipIndex:IndexPath) {
        
        let cardOneCell = collectionView.cellForItem(at: firstFlipIndex!) as? CardCollectionViewCell
        
        
        let cardTwoCell = collectionView.cellForItem(at: secondFlipIndex) as? CardCollectionViewCell
        
        let cardOne = cardArray[firstFlipIndex!.row]
        let cardTwo = cardArray[secondFlipIndex.row]
        
        if cardOne.imageName == cardTwo.imageName {
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
        }
        else {
            
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipppedBack()
            cardTwoCell?.flipppedBack()
        }
        
        firstFlipIndex = nil
    }
    
    
    
}

