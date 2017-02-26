//
//  NewsFeedViewController.swift
//  FacebookNewsFeed
//
//  Created by Tim Beals on 2017-02-21.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit

class NewsFeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var statusObjects = [StatusObject]()

    let cellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Facebook Feed"

        collectionView?.alwaysBounceVertical = true
        
        self.collectionView?.backgroundColor = ColorManager.customlightGrayBG()
        
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
        
        statusObjects = DataSource.returnStatusObjects()
    }    
    
    //MARK: change layout based on orientation // We need to invalidate the layout and redraw it when the orientation changes.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    //MARK: CollectionView delegate methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statusObjects.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeedCell
        let status = statusObjects[indexPath.item]
        cell.statusObject = status
        return cell
    }
    
    //MARK: CollectionViewFlowDelegate method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        //height of all the other cell components (found in the vertical of the cell)
        let knownHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 1 + 44
        
        //calculate the height of the status text based on its content
        if let text = statusObjects[indexPath.item].statusText {
            
            let size = CGSize(width: view.frame.width, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            
            let rect = NSString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)

            return CGSize(width: view.frame.width, height: (knownHeight + rect.height + 16))
        } else {
            return CGSize(width: view.frame.width, height: knownHeight)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
