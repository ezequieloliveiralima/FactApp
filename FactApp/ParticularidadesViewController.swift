//
//  ParticularidadesViewController.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 19/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class ParticularidadesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        
        var ImageName:String = "\(indexPath.row + 1)"
        var imageForCell:UIImage = UIImage(named: "Brasil")!
        cell.image = imageForCell
        let yOffset:CGFloat = ((collectionView.contentOffset.y - cell.frame.origin.y) / 200) * 25
        cell.imageOffset = CGPointMake(0, yOffset)
        
        return cell
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        for view in collectionView.visibleCells(){
            var view:CustomCollectionViewCell = view as! CustomCollectionViewCell
            let yOffset:CGFloat = ((collectionView.contentOffset.y - view.frame.origin.y) / 200) * 25
            view.setImageOffset(CGPointMake(0, yOffset))
        }
    }
}
