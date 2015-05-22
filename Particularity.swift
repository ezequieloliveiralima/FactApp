//
//  Particularity.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 20/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class Particularity {
    var title : String!
    var body : String!
    var type : String!
    var country : String!
    
    init() {}
    
    init(title: String, body: String, type: String, country: String) {
        self.title = title
        self.body = body
        self.type = type
        self.country = country
    }
}
