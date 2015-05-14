//
//  CircularScroll.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 14/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class CircularScroll: UIScrollView, UIScrollViewDelegate {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentSize = CGSizeMake(1500, self.frame.size.height)
        self.showsHorizontalScrollIndicator = false
    }
    
    func recenterIfNecessary() {
        var currentOffset = self.contentOffset
        var contentWidth = self.contentSize.width
        var centerOffsetX = (contentWidth - self.bounds.size.width) / 2.0
        var distanceFromCenter = fabs(currentOffset.x - centerOffsetX)
        
        if distanceFromCenter > (contentWidth/3) {
            self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.recenterIfNecessary()
    }
}
