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
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    let descriptionTextView: UITextView = {
        let textview = UITextView()
        let attributedText = NSMutableAttributedString(string: "Steve Jobs", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 20)])
        attributedText.append(NSAttributedString(string: "\n\n\nFounded the Apple company and invented the iphone. He got kicked out of his own company!", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor:UIColor.gray]))
        textview.attributedText = attributedText
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.textAlignment = .center
        return textview
        
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
//        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(descriptionTextView)
        appleImage.mainImageConstraints(view: view, mainInmageView: appleImage )
        descriptionTextView.setConstraintsForFounders(view: view, mainImageView: appleImage)
        setupButtomControls()
      
    }
    
    fileprivate func setupButtomControls() {
//        view.addSubview(prevButton)
//        prevButton.backgroundColor = .red
        let bottomControls = UIStackView(arrangedSubviews: [prevButton,pageControl,nextButton])
        bottomControls.translatesAutoresizingMaskIntoConstraints = false
        bottomControls.distribution = .fillEqually
        view.addSubview(bottomControls)
        bottomControls.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControls.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControls.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomControls.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }


}

extension UIView{
    func mainImageConstraints(view: UIView, mainInmageView: UIImageView){
        //set up container at the top half of the view
        let topImageConatinerView = UIView();
        view.addSubview(topImageConatinerView)
        topImageConatinerView.translatesAutoresizingMaskIntoConstraints = false;
        topImageConatinerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageConatinerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageConatinerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageConatinerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageConatinerView.addSubview(mainInmageView)

        self.centerYAnchor.constraint(equalTo: topImageConatinerView.centerYAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: topImageConatinerView.centerXAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: topImageConatinerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setConstraintsForFounders(view: UIView, mainImageView: UIView){
        self.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 120).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
}
