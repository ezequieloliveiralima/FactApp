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
    var data = [AnyObject]()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.title = NotificationCenter.defaultCenter.selected as String
        country = self.navigationController!.title!
//        let notificacao = NSNotificationCenter.defaultCenter()
//        notificacao.addObserver(self, selector: "teste:", name: "WILLGET", object: nil)
        
        var predicate = NSPredicate(format: "pais = %@", NSString(string: country))
        var consulta = PFQuery(className: "Particularidades", predicate: predicate)
        var error : NSErrorPointer = nil
        data = consulta.findObjects(error)!
        
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
        return data.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "particularidade")
        
        cell.textLabel!.text = data[indexPath.row].objectForKey("titulo") as? String
        
        return cell
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
