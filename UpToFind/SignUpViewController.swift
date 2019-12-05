//
//  SignUpViewController.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/1/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var signUpButton: ButView!
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var mailtext: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phone:    UITextField!
    @IBOutlet weak var address:  UITextField!
    let topImageView = UIImageView()
    let topBar = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
        // Do any additional setup after loading the view.
        setTopImage()
        
        
        

    }
    
    
    
    
    
    
    func setUpTextField() {
        let icon_username = UIImage(named: "maillogin")
        Utilities.styleTextField(username, andImage: icon_username!)
        
        let icon_mail = UIImage(named: "mail")
        Utilities.styleTextField(mailtext, andImage: icon_mail!)
        
        let icon_pw = UIImage(named: "motdepass")
        let butImg = UIImage(named: "showpass")
        Utilities.styleTextFields(password, andImage: icon_pw!, andrightbut: butImg!)
        
        let icon_phone = UIImage(named: "phone")
        Utilities.styleTextField(phone,andImage:icon_phone!)
        
        let icon_add = UIImage(named: "address")
        let but_add = UIImage(named: "findplace")
        Utilities.styleTextFields(address,andImage:icon_add!,andrightbut: but_add!)
        
        
    }
    
    
    @IBAction func backtoLogin(_ sender: Any) {
        
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? LoginViewController
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    func validateFields() -> String? {
        
        
        if  username.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            mailtext.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phone.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            address.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
      
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
           
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
       
         let validmail = mailtext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
     
        if Utilities.ismailValid(validmail) == false {
            
            return "Please enter your valid email ."
        }
     
        
        return nil
    }
    
    @IBAction func signupBut(_ sender: Any) {
        
         let error = validateFields()
        
           if error != nil {
                   
                   let alert = UIAlertController(title: "Oops!",
                                                 message: "\(String(describing: error))", preferredStyle: .alert)
                   let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                   alert.addAction(action)
                   self.present(alert, animated: true, completion: nil)
            
           }else {
            
           
            let usernames = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = mailtext.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let passwords = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phones = phone.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let placeaddress = address.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           
            Auth.auth().createUser(withEmail: email, password: passwords) { (result, err) in
                
                if err != nil {
                    let alert = UIAlertController(title: "Oops!",
                                                  message: "Error saving", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                                               
                    
                }
                else {
                    
                   
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["name":usernames, "email":email, "password":passwords, "phone":phones, "address":placeaddress, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                           
                            let alert = UIAlertController(title: "Oops!",
                                                                        message: "Error saving", preferredStyle: .alert)
                                              let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                                              alert.addAction(action)
                                              self.present(alert, animated: true, completion: nil)
                            
                        }
                    }
                    
                    
                    self.transitionToHome()
                }
                
            }
            
            
            
        }
        
    }
    func transitionToHome() {

   
        
      let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? ViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func setTopImage() {
    view.addSubview(topImageView)
    topImageView.translatesAutoresizingMaskIntoConstraints = false
    topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = false
    topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       topImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        topImageView.contentMode = UIView.ContentMode.scaleAspectFill
        topImageView.image = UIImage(named: "tsc")
        view.sendSubviewToBack(topImageView)
        
    }
   
}
