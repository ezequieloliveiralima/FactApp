//
//  NotificationCenter.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 18/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import Foundation
import Parse

class NotificationCenter {
    var selected = ""
    var data = [AnyObject]()
    
    var dataBrazil = [Particularity]()
    var dataMexico = [Particularity]()
    var dataCentral = [Particularity]()
    var dataUSA = [Particularity]()
    var dataCanada = [Particularity]()
    
    var toView = ""
    
    static let defaultCenter = NotificationCenter()
    private init() {}
}