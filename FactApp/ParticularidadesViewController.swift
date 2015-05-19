//
//  ParticularidadesViewController.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 19/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class ParticularidadesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var txtTitulo: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        txtTitulo.text = NotificationCenter.defaultCenter.toView
    }
}
