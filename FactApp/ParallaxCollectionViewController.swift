//
//  ParallaxCollectionViewController.swift
//  FactApp
//
//  Created by Guilherme on 21/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

let reuseIdentifier = "parallaxCell"

let images: [String] = ["Brasil.png","EUA.png","Mexico.png","Brasil.png","EUA.png","Mexico.png","Brasil.png","EUA.png","Mexico.png","Brasil.png","EUA.png","Mexico.png"]

class ParallaxCollectionViewController: UICollectionViewController {
    
    var data = [Particularity]()
    var received : String = ""
    var more = Particularity()
    var textMore: UITextView!
    var moreView: UIView!
    var imageBack = UIImageView(frame: CGRectMake(0, 0, 300, 300))
    var control = true
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showInfo:", name: "selectItem", object: nil)
        
        let myData = NotificationCenter.defaultCenter
        
        switch myData.selected {
        case "Brasil":
            for p : Particularity in myData.dataBrazil {
                if p.title == received && p.type != "mais" {
                    data.append(p)
                } else if p.type == "mais" && p.title == received {
                    more = p
                }
            }
            break
        case "Mexico":
            for p : Particularity in myData.dataMexico {
                if p.title == received && p.type != "mais" {
                    data.append(p)
                } else if p.type == "mais" && p.title == received {
                    more = p
                }
            }
            break
        case "USA":
            for p : Particularity in myData.dataUSA {
                if p.title == received && p.type != "mais" {
                    data.append(p)
                } else if p.type == "mais" && p.title == received {
                    more = p
                }
            }
            break
        default:
            break
        }
        
        moreView = UIView(frame: CGRectMake(CGFloat(UIScreen.mainScreen().bounds.width/2-150), CGFloat(UIScreen.mainScreen().bounds.height/2-150), 300, 300))
        
        textMore = UITextView(frame: CGRectMake(0, 0, 300, 300))
        textMore.text = more.body
        textMore.editable = false
        textMore.scrollEnabled = true
        textMore.selectable = false
        // Blur effect
        var blur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurView = UIVisualEffectView(effect: blur)
        blurView.frame = imageBack.bounds
        textMore.backgroundColor = UIColor.clearColor()
        imageBack.addSubview(blurView)
        blurView.addSubview(textMore)
        // End of Blur effect
        
        moreView.hidden = true
        
        moreView.addSubview(imageBack)
        
        self.view.addSubview(moreView)
        
        let vC = collectionView!.subviews
        for i in vC {
            if let j = i as? ParallaxCollectionViewCell {
                var yOffset = ((collectionView!.contentOffset.y - j.frame.origin.y) / ImageHeight) * OffsetSpeed
                j.offset(CGPointMake(0.0, yOffset))
                j.frame = CGRectMake(j.bounds.origin.x, j.bounds.origin.y, self.collectionView!.bounds.width, 200)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rotate:", name: "rotacionou", object: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.registerClass(ParallaxCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if !moreView.hidden {
            moreView.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return data.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var parallaxCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ParallaxCollectionViewCell
        
        //        parallaxCell.parallaxImageView?.image = UIImage(named: images[indexPath.row])!
        //
        if data[indexPath.row].type == "imagem" {
            let url = NSURL(string: data[indexPath.row].body!)
            let nsdata = NSData(contentsOfURL: url!)
            if let img = UIImage(data: nsdata!) {
                parallaxCell.parallaxImageView!.image = img
            }
        }
        
        //        parallaxCell.frame = CGRectMake(parallaxCell.frame.origin.x, parallaxCell.frame.origin.y, UIScreen.mainScreen().bounds.width, 180)
        //        parallaxCell.parallaxImageView.frame = CGRectMake(parallaxCell.frame.origin.x, parallaxCell.frame.origin.y, parallaxCell.frame.width, parallaxCell.frame.height+20)
        
        //        parallaxCell.parallaxImageView.bounds = parallaxCell.bounds
        
        if self.received == "Música" {
            parallaxCell.backgroundColor = hexaToUIColor("000000")
            imageBack.image = UIImage(named: "musica_bg")
        } else if self.received == "Gastronomia" {
            parallaxCell.backgroundColor = hexaToUIColor("000000")
            imageBack.image = UIImage(named: "gast_icon")
        } else {
            parallaxCell.backgroundColor = hexaToUIColor("000000")
            imageBack.image = UIImage(named: "arte_icon")
        }
        
        return parallaxCell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName("selectItem", object: nil, userInfo: ["sel" : data[indexPath.row].info])
    }
    
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        //        if let visibleCells = collectionView!.visibleCells() as? [ParallaxCollectionViewCell] {
        //            for parallaxCell in visibleCells {
        //                var yOffset = ((collectionView!.contentOffset.y - parallaxCell.frame.origin.y) / ImageHeight) * OffsetSpeed
        //                parallaxCell.offset(CGPointMake(0.0, yOffset))
        //            }
        //        }
        
        let vC = collectionView!.subviews
        for i in vC {
            if let j = i as? ParallaxCollectionViewCell {
                var yOffset = ((collectionView!.contentOffset.y - j.frame.origin.y) / ImageHeight) * OffsetSpeed
                j.offset(CGPointMake(0.0, yOffset))
            }
        }
    }
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        cell.frame = CGRect(x: 0, y: cell.frame.origin.y, width: self.collectionView!.frame.width, height: cell.frame.height)
    }
    
    func rotate(notification: NSNotification) {
        self.collectionView?.reloadData()
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
    }
    
    func showInfo(message: NSNotification) {
        let userinfo = message.userInfo as! NSDictionary
        //        print(userinfo.objectForKey("sel")!)
        textMore.text = userinfo.objectForKey("sel") as! String
        moreView.hidden = false
    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}
