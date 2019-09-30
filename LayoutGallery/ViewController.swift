//
//  ViewController.swift
//  LayoutGallery
//
//  Created by Muhammad Asad on 9/27/19.
//  Copyright © 2019 Muhammad Asad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //lets de clutter our view did load
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
//    let topImage = UIImageView(image: UIImage(named: "dribble"))
//    let titleText : UITextView = {
//        let textView  = UITextView()
//        textView.text = "You are welcome to join dribbble designers"
//        textView.textColor  = .red
//        textView.textAlignment = .center
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // view.backgroundColor = .white
        
        //Adding these views to the original view
//        view.addSubview(topImage)
//        view.addSubview(titleText)
        
        
        
        
        
        //setupViewLayout()
        
        //create a simple uiview
//        let headerView = UIView(frame:  CGRect(x: 0, y: 0, width: screenWidth-10, height: screenHeight*0.2))
//        headerView.backgroundColor = .magenta
//        headerView.center = self.view.center
        
        //self.view.addSubview(headerView)
        
     
    }

    
    
 
    
//    private func setupViewLayout(){
//        //enable autolayout for the imageview
//        //TOP IMAGE
//        topImage.translatesAutoresizingMaskIntoConstraints = false
//        
//        topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        topImage.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight/10).isActive = true
//        topImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3).isActive = true
//        topImage.heightAnchor.constraint(equalToConstant : UIScreen.main.bounds.height/3 ).isActive = true
//        
//        topImage.contentMode = .scaleAspectFit
//        
//        
//        //CENTER TEXT
//
//        titleText.topAnchor.constraint(equalTo:topImage.bottomAnchor, constant: 120).isActive = true
//        titleText.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        titleText.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        
//        titleText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }

}

