//
//  ViewController.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/2/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
let topImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTopImage()
        // Do any additional setup after loading the view.
    }
    @IBAction func LostObjButt(_ sender: Any) {
        
        let lostobjctViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.lostObjectViewController) as? LostObjectViewController
                              
                              self.view.window?.rootViewController = lostobjctViewController
                              self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func FoundObjButt(_ sender: Any) {
    }
    func setTopImage() {
         view.addSubview(topImageView)
         topImageView.translatesAutoresizingMaskIntoConstraints = false
         topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         topImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = false
         topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         topImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
         
         topImageView.image = UIImage(named: "tsc")
    }

}

