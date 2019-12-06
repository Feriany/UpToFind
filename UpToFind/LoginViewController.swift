//
//  ViewController.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/1/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    
    
let topImageView = UIImageView()
    
    @IBOutlet weak var usernamtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var checked: UIButton!
    
    @IBOutlet weak var createAccountBut: UIButton!
    
    @IBOutlet weak var forgetPwButt: UIButton!
    var iconClick = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        setUpCheckBox()
        setUpTextField()
        setTopImage()
        usernamtext.becomeFirstResponder()
        
    }
    
    
    
    @IBAction func ischecked(_ sender: Any) {
        checked.backgroundColor = .clear
                   
        if iconClick == true {
           
        checked.setTitle("✓",for: .normal)
        checked.tintColor = .black
            
        }else{
            checked.setTitle("",for: .normal)
        }
        iconClick = !iconClick
    }
    
    
   @IBAction func showPasswords(_ sender: Any) {
      /*
        print("show password taped")
        
        if(iconClick == true) {
            passwordtext.secureTextEntry = false
        } else {
            passwordtext.secureTextEntry = true
        }

        iconClick = !iconClick*/
    }
    
    func setUpButton(){
        Utilities.styleButton(createAccountBut)
        Utilities.styleButton(forgetPwButt)
    }
    func setUpCheckBox() {
        checked.layer.borderWidth = 1
        checked.layer.borderColor = UIColor.black.cgColor
    }
    
   func setUpTextField() {
       let icon_mail = UIImage(named: "maillogin")
       Utilities.styleTextField(usernamtext, andImage: icon_mail!)
       
        let icon_pw = UIImage(named: "motdepass")
        let but_pw = UIImage(named: "showpass")
       Utilities.styleTextFields(passwordtext, andImage: icon_pw!, andrightbut: but_pw!)
       
   }
   
    
    @IBAction func createAccountButton(_ sender: Any) {
        
        let signupViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.signupViewController) as? SignUpViewController
       
       self.view.window?.rootViewController = signupViewController
       self.view.window?.makeKeyAndVisible()
    }
    
    
    
    @IBAction func loginBut(_ sender: Any) {
        
       
        let email = usernamtext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordtext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
     
       
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                   
                   if error != nil {
                     
                    let alert = UIAlertController(title: "Oops!",
                    message: "\(error!.localizedDescription)", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
        
                      
                   }
                   else {
                    
                       let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? ViewController
                       
                       self.view.window?.rootViewController = homeViewController
                       self.view.window?.makeKeyAndVisible()
                   }
               }
    
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
         view.sendSubviewToBack(topImageView)
}
    
}

extension UIViewController {
    
func dismissKey()
{
let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = true
    view.addGestureRecognizer(tap)
}
@objc func dismissKeyboard(){
view.endEditing(true)
}
}
