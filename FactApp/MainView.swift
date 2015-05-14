//
//  MainvIEW.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 14/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    @IBOutlet weak var southAmerica: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "alert:")
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        southAmerica.addGestureRecognizer(tapGesture)
    }
    
    func alert(recognizer : UITapGestureRecognizer) {
        print("Clicou")
    }
    
}
