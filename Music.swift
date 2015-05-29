//
//  Music.swift
//  FactApp
//
//  Created by Ezequiel de Oliveira Lima on 29/05/15.
//  Copyright (c) 2015 Ezequiel de Oliveira Lima. All rights reserved.
//

import UIKit

class Music: Particularity {
    var url : String!
    
    init(title: String, body: String, type: String, country: String, url: String) {
        super.init(title: title, body: body, type: type, country: country)
        self.url = url
    }
}
