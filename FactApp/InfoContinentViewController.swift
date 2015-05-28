//
//  InfoContinentViewController.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 18/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit
import Foundation
import Parse

class InfoContinentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var txtTitle: UILabel!
    var info = [ "Música", "Arte", "Gastronomia" ]
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewWillAppear(animated: Bool) {
        if NotificationCenter.defaultCenter.selected == "Canada" {
            info.append("Intercambio")
        }
        info.sort({$0 < $1})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "particularidade")
        
        let title = info[indexPath.row]
        switch title {
        case "Música":
            cell.backgroundColor = UIColor(patternImage: UIImage(named: "Musica")!)
            break
        case "Arte":
            cell.backgroundColor = UIColor(patternImage: UIImage(named: "Arte")!)
            break
        case "Gastronomia":
            cell.backgroundColor = UIColor(patternImage: UIImage(named: "Gastronomia")!)
            break
        default:
            println("")
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    var row = 0
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var vc = self.storyboard!.instantiateViewControllerWithIdentifier("particularidades") as! ParticularidadesViewController
//        self.navigationController!.pushViewController(vc, animated: true)
        row = indexPath.row
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.performSegueWithIdentifier("select", sender: self)

    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform = CATransform3DMakeScale(1,1,1)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "select" {
            if let destination = segue.destinationViewController as? ParallaxCollectionViewController {
                destination.received = info[row]
            }
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
