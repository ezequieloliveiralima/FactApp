//
//  ShowParticularities.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 21/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class ShowParticularities: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var data = [Particularity]()
    var received : String = ""
    var more = Particularity()
    var textMore: UITextView!
    var moreView: UIView!
    var control = true
    
    //    @IBOutlet weak var viewMore: UIView!
    //    @IBOutlet weak var moreText: UITextView!
    
    @IBOutlet weak var btnShowMoreOutlet: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        default:
            break
        }

        moreView = UIView(frame: CGRectMake(CGFloat(UIScreen.mainScreen().bounds.width/2-150), CGFloat(UIScreen.mainScreen().bounds.height/2-150), 300, 300))
        var imageBack = UIImageView(frame: CGRectMake(0, 0, 300, 300))
        imageBack.image = UIImage(named: "musica_bg")
        
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
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("particularity", forIndexPath: indexPath) as! UITableViewCell
        
        if data[indexPath.row].type == "imagem" {
            cell.imageView?.image = UIImage(data: NSData(contentsOfURL: NSURL(string: data[indexPath.row].body)!)!)
        }
        
        return cell
    }
    
    @IBAction func showMore(sender: AnyObject) {
        if control {
            textMore.textColor = UIColor.blackColor()
//            textMore.font = UIFont(name: "American Typewriter", size: 14)
            textMore.textAlignment = NSTextAlignment.Justified
            moreView.hidden = false
            btnShowMoreOutlet.title = "Menos"
        } else {
            btnShowMoreOutlet.title = "Ver mais"
            moreView.hidden = true
        }
        
        control = !control
    }
    
}
