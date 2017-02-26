//
//  FeedCell.swift
//  FacebookNewsFeed
//
//  Created by Tim Beals on 2017-02-21.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    var statusObject: StatusObject? {
        didSet {
            if let name = statusObject?.name {
                
                let attributedString = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
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
                
                nameLabel.attributedText = attributedString
                
                if let text = statusObject?.statusText {
                    statusTextView.text = text
                }
                
                if let imageName = statusObject?.imageName {
                    statusImageView.image = UIImage(named: imageName)
                }
                
                if let profileImageName = statusObject?.profileImageName {
                    profileImageView.image = UIImage(named: profileImageName)
                }
            }
        }
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        return label
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
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
        imageView.backgroundColor = ColorManager.customBlue()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "488 likes      1.6k Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = ColorManager.customGrayText()
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorManager.customlightGrayBG()
        return view
    }()
    
    
    let likeButton: UIButton = FeedCell.createButtonFor(title: "Like", imageName: "like_icon")
    let commentButton: UIButton = FeedCell.createButtonFor(title: "Comment", imageName: "comment_icon")
    let shareButton: UIButton = FeedCell.createButtonFor(title: "Share", imageName: "share_icon")
    
    //similar to a class function, but it cannot be overridden
    static func createButtonFor(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(ColorManager.customGrayText(), for: .normal)
        
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        //This creates the spacing to the left of the title (top, left, bottom, right)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        return button
    }
    
    
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
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        //Custom extension method declared in Helpers
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", for: profileImageView, nameLabel)
        
        //Don't give the text view a hard-coded height, so that it can expand to fill the remaining allowable space of the cell.
        addConstraintsWithFormat("V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(1)][v5(44)]|", for: profileImageView, statusTextView, statusImageView, likesCommentsLabel, dividerLineView, likeButton)
        addConstraintsWithFormat("V:|-8-[v0]", for: nameLabel)
        addConstraintsWithFormat("H:|-4-[v0]-4-|", for: statusTextView)
        addConstraintsWithFormat("H:|[v0]|", for: statusImageView)
        addConstraintsWithFormat("H:|-8-[v0]|", for: likesCommentsLabel)
        addConstraintsWithFormat("H:|-8-[v0]-8-|", for: dividerLineView)
        addConstraintsWithFormat("H:|[v0(v2)][v1(v2)][v2]|", for: likeButton, commentButton, shareButton)
        //Note the share spacing format above ^
        addConstraintsWithFormat("V:[v0(44)]|", for: commentButton)
        addConstraintsWithFormat("V:[v0(44)]|", for: shareButton)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
