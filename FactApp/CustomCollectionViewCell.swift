//
//  CustomCollectionViewCell.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 19/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    var imageView: UIImageView!
    var imageOffset: CGPoint!
    
    var image: UIImage! {
        get {
            return self.image
        } set {
            self.imageView.image = newValue
            if imageOffset != nil{
                setImageOffset(imageOffset)
            }else{
                setImageOffset(CGPointMake(0, 0))
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImageView()
    }
    
    func setupImageView() {
        self.clipsToBounds = true
        imageView = UIImageView(frame: CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.width, 100))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = false
        self.addSubview(imageView)
    }
    
    func setImageOffset(imageOffset:CGPoint) {
        self.imageOffset = imageOffset
        let frame:CGRect = imageView.bounds
        let offsetFrame:CGRect = CGRectOffset(frame, self.imageOffset.x, self.imageOffset.y)
        imageView.frame = offsetFrame
    }
}
