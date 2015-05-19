//
//  NotificationCenter.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 18/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import Foundation

class NotificationCenter {
    var selected = ""
    var data = [AnyObject]()
    var toView = ""
    
    static let defaultCenter = NotificationCenter()
    private init() {}
}