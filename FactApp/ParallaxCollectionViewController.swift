//
//  ParallaxCollectionViewController.swift
//  FactApp
//
//  Created by Guilherme on 21/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit
import MediaPlayer

let reuseIdentifier = "parallaxCell"

class ParallaxCollectionViewController: UICollectionViewController {
    var mediaPlayer : MPMoviePlayerController = MPMoviePlayerController()
    
    var data = [Particularity]()
    var received : String = ""
    var more = Particularity()
    var textMore: UITextView!
    var moreView: UIView!
    var imageBack = UIImageView()
    var control = true
    
    var imagens = [UIImage]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width/3, height: UIScreen.mainScreen().bounds.width/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        self.imageBack.frame = CGRect(x: 0, y: 65, width: self.view.frame.width, height: self.view.frame.height-100)
        
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
        case "EUA":
            for p : Particularity in myData.dataUSA {
                if p.title == received && p.type != "mais" {
                    data.append(p)
                } else if p.type == "mais" && p.title == received {
                    more = p
                }
            }
            break
        case "Canada":
            for p : Particularity in myData.dataCanada {
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
        
        for p : Particularity in data {
            if p.type == "imagem" {
                let url = NSURL(string: p.body!)
                let nsdata = NSData(contentsOfURL: url!)
                if let img = UIImage(data: nsdata!) {
                    imagens.append(img)
                }
            }
        }
        
        moreView = UIView(frame: self.view.bounds)
        
        textMore = UITextView(frame: self.view.bounds)
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
        
        parallaxCell.parallaxImageView!.image = imagens[indexPath.row]
        
        parallaxCell.backgroundColor = hexaToUIColor("000000")
        return parallaxCell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if data[indexPath.row].title == "Música" {
            mediaPlayer.stop()
            let music = data[indexPath.row] as! Music
            mediaPlayer.contentURL = NSURL(string: music.url)
            mediaPlayer.play()
        }
        NSNotificationCenter.defaultCenter().postNotificationName("selectItem", object: nil, userInfo: ["sel" : data[indexPath.row].info])
    }
    
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
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
        let userinfo = NSDictionary(dictionary: message.userInfo!)
        textMore.text = userinfo.objectForKey("sel") as! String
        textMore.font = UIFont(name: "american typewriter", size: 15)
        textMore.textColor = UIColor.blackColor()
        textMore.textAlignment = NSTextAlignment.Justified
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
