//
//  Teste.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 20/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class Teste: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clearColor()
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celula = UITableViewCell()
        if let cell : CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as? CustomTableViewCell {
        
        cell.myImage.image = UIImage(named: "Gastronomia")
        let yOffset:CGFloat = ((tableView.contentOffset.y - cell.frame.origin.y) / 200) * 12.5
        cell.imageOffset = CGPointMake(0, yOffset)

        
        return cell
        }
        return celula
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        for view in tableView.visibleCells(){
            var view:CustomTableViewCell = view as! CustomTableViewCell
            let yOffset:CGFloat = ((tableView.contentOffset.y - view.frame.origin.y) / 200) * 12.5
            view.setImageOffset(CGPointMake(0, yOffset))
        }
    }

    
}
