//
//  ViewController.swift
//  SlideView
//
//  Created by Shannen Bravo-Brown on 5/17/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let appleImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "apple"))
        image.translatesAutoresizingMaskIntoConstraints = false;
        return image
    }()
    
    let descriptionTextView: UITextView = {
        let textview = UITextView()
        textview.text = "Steve Jobs"
        textview.font = UIFont.boldSystemFont(ofSize: 20)
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.textAlignment = .center
        return textview
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(appleImage)
        view.addSubview(descriptionTextView)
        appleImage.mainImageConstraints(view: view)
        descriptionTextView.setConstraintsForFounders(view: view, mainImageView: appleImage)
      
    }


}

extension UIView{
    func mainImageConstraints(view: UIView){
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        self.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setConstraintsForFounders(view: UIView, mainImageView: UIView){
        self.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 120).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
}
