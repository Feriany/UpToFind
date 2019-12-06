//
//  HomeViewController.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/2/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
   
    var delegate : HomeControllerDelegate?
    
    let topImageView = UIImageView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        ConfigureNavigationBar()
        setTopImage()
    }
   
    @objc
    func handleMenuToggel(){
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func ConfigureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName:"butMenu"),style: .done, target: self, action: #selector(handleMenuToggel))
        
    }
    
     func setTopImage() {
           
         view.addSubview(topImageView)
        
         topImageView.translatesAutoresizingMaskIntoConstraints = false
         topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         topImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = false
         topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         topImageView.heightAnchor.constraint(equalToConstant: 170).isActive = true
         
         topImageView.image = UIImage(named: "tsc")
             //view.sendSubviewToBack(topImageView)
    }
}
