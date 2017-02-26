//
//  statusObject.swift
//  FacebookNewsFeed
//
//  Created by Tim Beals on 2017-02-23.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class StatusObject: NSObject {

    let name: String
    var statusText: String?
    var imageName: String?
    var profileImageName: String?
    
    init(name: String) {
        self.name = name
    }    
    
}
