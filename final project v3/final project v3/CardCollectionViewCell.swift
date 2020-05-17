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
        
    }
    
    func flipped() {
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.1, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipppedBack() {
           UIView.transition(from: frontImageView, to: backImageView, duration: 0.1, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    
    
    
    
    
}
