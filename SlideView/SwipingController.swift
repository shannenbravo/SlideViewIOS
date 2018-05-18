//
//  swipingController.swift
//  SlideView
//
//  Created by Shannen Bravo-Brown on 5/17/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    let pages = [Page(imageName: "apple", headerText: "Steve Jobs", subText: "Created Apple and teh iphone. Got kicked outta his own company"),
                 Page(imageName: "windows", headerText: "Bill Gates", subText: "Created the largest company in the world"),
                 Page(imageName: "android", headerText: "Google", subText: "The most selling moile device OS"),
                 Page(imageName: "spotify", headerText: "Shannen", subText: "Will do great things in this world!" )
    ]
    
//    let imageName = ["apple",  "windows", "android", "spotify"]
//    let headerStrings = ["Steve Jobs", "Bill Gates", "Google", "Shannen Bravo" ]
    override func viewDidLoad(){
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
//        cell.appleImage.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.headerText
//
//        let logoImage = pages[indexPath.item]
//        cell.appleImage.image = UIImage(named: logoImage)
//        cell.descriptionTextView.text = headerStrings[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
