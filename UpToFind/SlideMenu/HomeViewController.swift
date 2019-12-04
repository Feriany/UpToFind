//
//  HomeViewController.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/2/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    // MARK:-Properties
    var delegate : HomeControllerDelegate?
    // MARK:-Init
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        ConfigureNavigationBar()
    }
    // MARK:-Handlers
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
}
