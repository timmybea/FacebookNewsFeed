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
        label.numberOfLines = 2
        
        let attributedString = NSMutableAttributedString(string: "Bart Simpson", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        attributedString.append(NSAttributedString(string: "\nFebruary 21st ∙ Springfield ∙ ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: ColorManager.customGrayText()]))
        
        //add line spacing
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.string.characters.count))
        
        
        //add globe image as text attribute
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "globe-01-512")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedString.append(NSAttributedString(attachment: attachment))
    
        label.attributedText = attributedString
        
        return label
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Eat my shorts!"
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Bart-Simpson-01-icon")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = ColorManager.customBlue()
        return imageView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "swimming_bart")
        imageView.backgroundColor = ColorManager.customBlue()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
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
        addSubview(statusTextView)
        addSubview(statusImageView)
        
        //Custom extension method declared in Helpers
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", for: profileImageView, nameLabel)
        addConstraintsWithFormat("V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]|", for: profileImageView, statusTextView, statusImageView)
        addConstraintsWithFormat("V:|-8-[v0]", for: nameLabel)
        addConstraintsWithFormat("H:|-4-[v0]-4-|", for: statusTextView)
        addConstraintsWithFormat("H:|[v0]|", for: statusImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
