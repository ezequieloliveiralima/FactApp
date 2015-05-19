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
    var country = ""

    
    override func loadView() {
        super.loadView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.title = NotificationCenter.defaultCenter.selected as String
        country = self.navigationController!.title!
//        let notificacao = NSNotificationCenter.defaultCenter()
//        notificacao.addObserver(self, selector: "teste:", name: "WILLGET", object: nil)
        
        var predicate = NSPredicate(format: "pais = %@", NSString(string: self.country))
        var consulta = PFQuery(className: "Particularidades", predicate: predicate)
        var error : NSErrorPointer = nil
        NotificationCenter.defaultCenter.data = consulta.findObjects(error)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func teste(notification : NSNotification) {
        let info: NSDictionary = notification.userInfo!
        txtTitle.text = info.objectForKey("title") as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotificationCenter.defaultCenter.data.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "particularidade")
        
        cell.textLabel!.text = NotificationCenter.defaultCenter.data[indexPath.row].objectForKey("titulo") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NotificationCenter.defaultCenter.toView = (NotificationCenter.defaultCenter.data[indexPath.row].objectForKey("titulo") as? String)!
        var vc = self.storyboard!.instantiateViewControllerWithIdentifier("particularidades") as! ParticularidadesViewController
        self.navigationController!.pushViewController(vc, animated: true)
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
