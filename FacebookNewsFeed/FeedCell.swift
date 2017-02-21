//
//  FeedCell.swift
//  FacebookNewsFeed
//
//  Created by Tim Beals on 2017-02-21.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample name"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = ColorManager.cutomBlue()
        label.translatesAutoresizingMaskIntoConstraints = false
      //  label.backgroundColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViews()
    }

    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        
        //Custom extension method declared in Helpers
        addConstraintsWithFormat("H:|[v0]|", for: nameLabel)
        addConstraintsWithFormat("V:|[v0]|", for: nameLabel)
        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
