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
        let attributedString = NSMutableAttributedString(string: "Bart Simpson", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        label.attributedText = attributedString
        label.textColor = ColorManager.cutomBlue()
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Bart-Simpson-01-icon")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = ColorManager.cutomBlue()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViews()
    }

    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        
        //Custom extension method declared in Helpers
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", for: profileImageView, nameLabel)
        addConstraintsWithFormat("V:|-8-[v0(44)]", for: profileImageView)
        addConstraintsWithFormat("V:|-8-[v0(20)]", for: nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
