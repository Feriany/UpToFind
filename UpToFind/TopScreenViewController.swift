//
//  TopScreenViewController.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/5/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit

class TopScreenViewController: UIViewController {
let topImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
setTopImage()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
