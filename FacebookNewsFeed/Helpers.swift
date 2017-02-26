//
//  Helpers.swift
//  FacebookNewsFeed
//
//  Created by Tim Beals on 2017-02-21.
//  Copyright © 2017 Tim Beals. All rights reserved.
//


import UIKit

extension UIView {
    
    func addConstraintsWithFormat(_ format: String, for views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let viewString = "v\(index)"
            viewsDictionary[viewString] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

class DataSource: NSObject {
    
    class func returnStatusObjects() -> [StatusObject] {
        
        var statusObjects = [StatusObject]()
        
        let bartStatus = StatusObject(name: "Bart Simpson")
        bartStatus.statusText = "I didn't do it, nobody saw me do it, there's no way you can prove anything!"
        
        let homerStatus = StatusObject(name: "Homer Simpson")
        homerStatus.statusText = "Donuts. Is there anything they can't do?"
        
        
        statusObjects.append(bartStatus)
        statusObjects.append(homerStatus)
        
        
        return statusObjects
    }
    
    
    
}
