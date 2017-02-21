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
