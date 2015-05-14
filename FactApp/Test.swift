//
//  Test.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 14/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class Test: UIViewController {
    
    @IBOutlet weak var scroll: CircularScroll!
    
    let mondial = [
        [0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
        [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        print(mondial[0].count)
        
        for i in 0..<mondial.count {
            let w = UIScreen.mainScreen().bounds.width/55
            for j in 0..<mondial[i].count {
                var y = Double(w) * Double(i)
                var x = Double(w) * Double(j)

                if mondial[i][j] == 0 {
                    let ocean = UIView(frame: CGRectMake(CGFloat(x), CGFloat(y+30.0), w, w))
                    ocean.backgroundColor = UIColor.blueColor()
                    self.view.addSubview(ocean)
                } else {
                    let point = UIButton(frame: CGRectMake(CGFloat(x), CGFloat(y+30.0), w, w))
                    point.backgroundColor = UIColor.blackColor()
                    self.view.addSubview(point)
                    point.tag = i
                    point.addTarget(self, action: "btn:", forControlEvents: UIControlEvents.TouchDown)
                }
            }
        }
    }
    
    func btn(sender : AnyObject?) {
        println("ok")
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}