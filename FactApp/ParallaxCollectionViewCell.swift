//
//  ParallaxCollectionViewCell.swift
//  FactApp
//
//  Created by Guilherme on 21/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

let ImageHeight: CGFloat = 200.0
let OffsetSpeed: CGFloat = 25.0

class ParallaxCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var parallaxImageView: UIImageView!
    
    
    func offset(offset: CGPoint) {
        parallaxImageView.frame = CGRectOffset(self.parallaxImageView.bounds, offset.x, offset.y)
    }
    
    
    
    
    
}
