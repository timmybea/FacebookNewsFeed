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
        
        var viewNumber = 0
        var viewsDictionary = [String: UIView]()
        
        for view in views {
            let viewString = "v\(viewNumber)"
            viewsDictionary[viewString] = view
            viewNumber += 1
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
