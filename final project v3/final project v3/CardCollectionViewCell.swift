//
//  CardCollectionViewCell.swift
//  final project v3
//
//  Created by jayjay venegas on 5/17/20.
//  Copyright © 2020 jayjay venegas. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func set(_ card:Card) {
        
        self.card = card
        
        
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isFlipped == true{
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromLeft, . showHideTransitionViews], completion: nil)
            
        }
        
        
    }
    
    func flipped() {
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.1, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipppedBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.1, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        
    }
    
    func remove() {
        
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
        
    }
    
    
    
    
}
