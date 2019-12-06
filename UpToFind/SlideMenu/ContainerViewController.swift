//
//  ContainerViewController.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/2/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var menuController: MenuController!
    var centreController : UIViewController!
    var isExpanded = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureHomeController()
       view.backgroundColor = UIColor(red:27/255, green:14/255, blue:85/255, alpha: 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    
    
    func ConfigureHomeController()  {
        let homeController = HomeController()
        homeController.delegate = self
         centreController = UINavigationController(rootViewController: homeController)
        view.addSubview(centreController.view)
        addChild(centreController)
        centreController.didMove(toParent: self)
        
        
    }
    func ConfigureMenuController(){
           
           if menuController == nil {
               menuController = MenuController()
               menuController.delegate = self
               view.insertSubview(menuController.view, at: 0)
               addChild(menuController)
               menuController.didMove(toParent: self)
               
           }
           
       }
    func animatedPanel(ShouldExpand: Bool, menuOption :MenuOption?){
        if ShouldExpand {
            
            UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 10, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centreController.view.frame.origin.x = self.centreController.view.frame.width - 100
            }, completion: nil)
        }else{
            
           
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centreController.view.frame.origin.x = 0
            }) { (_) in
                
                guard let menuOption = menuOption else{ return}
                self.didSelectMenuOption(menuOption : menuOption)
            }
        }
        animatedStatusBar()
    }
    
    func didSelectMenuOption(menuOption :MenuOption)  {
        switch menuOption {
            
        case .Home:
            print("show profile")
        case .FindObject:
              print("show profile")
        case .Profile:
              print("show inbox")
        case .Notification:
              print("show notification")
        case .Contact:
              print("loging Out")
            case .Setting:
              print("show inbox")
            case .About:
              print("show notification")
            case .Logout:
              print("loging Out")
        
    }
   
}
    func animatedStatusBar(){
        UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 10, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
                  }, completion: nil)
    }
    
}
    
extension ContainerController : HomeControllerDelegate {
    
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        
           if !isExpanded{
                 ConfigureMenuController()
             }
             
             isExpanded = !isExpanded
             animatedPanel(ShouldExpand: isExpanded, menuOption: menuOption)
         }
    }
    
    
     
    
    


