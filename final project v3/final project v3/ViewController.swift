//
//  ViewController.swift
//  final project v3
//
//  Created by jayjay venegas on 5/12/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
   
    var cardArray = [Card]()
    var model = CardM()
    var firstFlipIndex:IndexPath?
   
    
    var timer:Timer?
    var milliseconds:Float = 20 * 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        
        
    }
    
    
    @objc func timerElapsed() {
        milliseconds -= 1
        
        let seconds = String(format: "%.2f", milliseconds/1000)
        
        timerLabel.text = "Time Remaing: \(seconds)"
        
        
        if milliseconds <= 0 {
            timer?.invalidate()
            
            checkGamEnded()
        }
        
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
        
        if milliseconds <= 0 {
            return
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
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
            
            checkGamEnded()
        }
        else {
            
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipppedBack()
            cardTwoCell?.flipppedBack()
        }
        
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlipIndex!])
        }
        
        
        firstFlipIndex = nil
    }
    
    
    func checkGamEnded() {
        var isWon = true
        
        for card in cardArray {
            if card.isMatched == false {
                isWon = false
                break
                
            }
        }
        var title = ""
        var message = ""
        
        if isWon == true {
            
            if milliseconds > 0 {
                timer?.invalidate()
            }
            
            title = "Way to go!"
            message = "you beat the game"
            
            
        }
        else {
            
            if milliseconds > 0 {
                return
            }
            
            title = "L"
            message = "You lost"
            
            
        }
        showAlert(title, message)
    }
    
 func showAlert(_ title:String, _ message:String) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let alertAction = UIAlertAction(title: "Restart", style: .default) { (restart) in
             self.restart()
         }
         alert.addAction(alertAction)
         self.present(alert, animated: true, completion: nil)
     }

     
     func restart() {
         cardArray = [Card]()
         cardArray = model.getCards()
         milliseconds = 20 * 1000
         timerLabel.textColor = UIColor.black
         collectionView.reloadData()
         timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
         RunLoop.main.add(timer!, forMode: .common)
     }
    
}

