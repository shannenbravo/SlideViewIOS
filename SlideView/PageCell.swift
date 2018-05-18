//
//  PageCell.swift
//  SlideView
//
//  Created by Shannen Bravo-Brown on 5/17/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    var page: Page? {
        didSet{
            guard let unerappedPage = page else {return}
            appleImage.image = UIImage(named: unerappedPage.imageName)
            let attributedText = NSMutableAttributedString(string: unerappedPage.headerText, attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)])
            attributedText.append(NSAttributedString(string: "\n\n\n\(unerappedPage.subText)", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor:UIColor.gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let appleImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "apple"))
        image.translatesAutoresizingMaskIntoConstraints = false;
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let descriptionTextView: UITextView = {
        let textview = UITextView()
        let attributedText = NSMutableAttributedString(string: "Steve Jobs", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)])
        attributedText.append(NSAttributedString(string: "\n\n\nFounded the Apple company and invented the iphone. He got kicked out of his own company!", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor:UIColor.gray]))
        textview.attributedText = attributedText
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.textAlignment = .center
        textview.isEditable = false
        return textview
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        imageConstraints()
    }
    
    func imageConstraints(){
        //set up container at the top half of the view
        let topImageConatinerView = UIView();
        addSubview(topImageConatinerView)
        topImageConatinerView.translatesAutoresizingMaskIntoConstraints = false;
        topImageConatinerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageConatinerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageConatinerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageConatinerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageConatinerView.addSubview(appleImage)
        
        appleImage.centerYAnchor.constraint(equalTo: topImageConatinerView.centerYAnchor).isActive = true
        appleImage.centerXAnchor.constraint(equalTo: topImageConatinerView.centerXAnchor).isActive = true
        appleImage.heightAnchor.constraint(equalTo: topImageConatinerView.heightAnchor, multiplier: 0.5).isActive = true
       
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageConatinerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
