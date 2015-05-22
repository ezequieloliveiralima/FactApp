//
//  CustomTableViewCell.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 20/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var imageOffset: CGPoint!

    @IBOutlet weak var myImage: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImageView()
    }
    
    func setupImageView() {
        self.clipsToBounds = true
        self.myImage = UIImageView(frame: CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.width, 100))
//        self.myImage.contentMode = UIViewContentMode.ScaleAspectFill
//        self.myImage.clipsToBounds = false
//        self.addSubview(self.myImage)
    }
    
    func setImageOffset(imageOffset:CGPoint) {
        self.imageOffset = imageOffset
        let frame:CGRect = self.myImage.bounds
        let offsetFrame:CGRect = CGRectOffset(frame, self.imageOffset.x, self.imageOffset.y)
        self.myImage.frame = offsetFrame
    }
}
