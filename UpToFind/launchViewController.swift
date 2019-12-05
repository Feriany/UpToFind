//
//  launchViewController.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/2/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
var progressBarTimer: Timer!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var lunchImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         progressbar()
         view.backgroundColor = UIColor(red:27/255, green:14/255, blue:85/255, alpha: 1)
        
    }
    

   func progressbar()  {
       progressView.progress = 0.0
       progressView.layer.cornerRadius = 10
       progressView.clipsToBounds = true
       progressView.layer.sublayers![1].cornerRadius = 10
       progressView.subviews[1].clipsToBounds = true
       self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(LaunchViewController.updateProgressView), userInfo: nil, repeats: true)
       
       progressView.progressTintColor = UIColor(red:68/255, green:33/255, blue:224/255, alpha: 1)
       progressView.trackTintColor = .white
       progressView.progressViewStyle = .default
   }
     
      override var prefersStatusBarHidden: Bool{
          return true
      }
   override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
   }
   
   @objc func updateProgressView() {
   progressView.progress += 0.1
   progressView.setProgress(progressView.progress, animated: true)
   if(progressView.progress == 1.0)
   { progressBarTimer.invalidate()
    transitionToLogin()
   }
    
    
   }
    func transitionToLogin(){
    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? LoginViewController
    self.view.window?.rootViewController = homeViewController
    self.view.window?.makeKeyAndVisible()
}
}
