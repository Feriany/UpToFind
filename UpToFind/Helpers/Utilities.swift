//
//  Utilities.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/2/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import Foundation
import UIKit


class Utilities {
    
    
    
    struct Colors {
              static let tropicBlue = UIColor(red: 0, green: 192/255, blue: 255/255, alpha: 1)
          }


          struct Fonts {
              static let avenirNextCondensedDemiBold = "Nexa Light"
          }
    
    static func styleTextField(_ textfield:UITextField, andImage img: UIImage) {
        
         let textfieldLine = CALayer()
        textfieldLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
       
        
        textfield.tintColor             = .black
        textfield.textColor             = .black
        textfield.font                  = UIFont(name: Fonts.avenirNextCondensedDemiBold, size: 18)
        textfield.backgroundColor       = UIColor(white: 1.0, alpha: 0.5)
        
        textfield.autocorrectionType    = .no
        textfield.layer.cornerRadius    = 22.0
        textfield.layer.borderWidth     = 1.0
        textfield.clipsToBounds         = true
        
        let placeholder       = textfield.placeholder != nil ? textfield.placeholder! : "  "
        let placeholderFont   = UIFont(name: Fonts.avenirNextCondensedDemiBold, size: 18)!
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
             NSAttributedString.Key.font: placeholderFont])
       textfield.layer.addSublayer(textfieldLine)
        
        
        let iconView = UIImageView(frame:
                             CGRect(x:20, y: 0, width: 20, height: 20))
              iconView.image = img
        
              let iconContainerView: UIView = UIView(frame:
                             CGRect(x:0, y: 0, width: 45, height: 20))
              iconContainerView.addSubview(iconView)
        
        textfield.leftView = iconContainerView
        textfield.leftViewMode          = .always
        
    }
    
    
    
    static func styleTextFields(_ textfield:UITextField, andImage img: UIImage,andrightbut butImg: UIImage) {
        
         let textfieldLine = CALayer()
        textfieldLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
       
        
        textfield.tintColor             = .black
        textfield.textColor             = .black
        textfield.font                  = UIFont(name: Fonts.avenirNextCondensedDemiBold, size: 16)
        textfield.backgroundColor       = UIColor(white: 1.0, alpha: 0.5)
        
        textfield.autocorrectionType    = .no
        textfield.layer.cornerRadius    = 22.0
        textfield.layer.borderWidth     = 1.0
        textfield.clipsToBounds         = true
        textfield.clearButtonMode = .always
        textfield.clearButtonMode = .whileEditing
        
        let placeholder       = textfield.placeholder != nil ? textfield.placeholder! : "  "
        let placeholderFont   = UIFont(name: Fonts.avenirNextCondensedDemiBold, size: 18)!
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
             NSAttributedString.Key.font: placeholderFont])
       textfield.layer.addSublayer(textfieldLine)
        
        
        let iconView = UIImageView(frame:
                             CGRect(x:20, y: 0, width: 20, height: 20))
              iconView.image = img
        
              let iconContainerView: UIView = UIView(frame:
                             CGRect(x:0, y: 0, width: 45, height: 20))
              iconContainerView.addSubview(iconView)
        
        textfield.leftView = iconContainerView
        textfield.leftViewMode          = .always
        
        
     
        let button = UIButton(type: .custom)
        
        button.setImage(butImg, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 3, left: -3, bottom: 4, right: 12)
         button.frame = CGRect(x: CGFloat(textfield.frame.size.width - 15), y: CGFloat(5), width: CGFloat(10), height: CGFloat(10))
        button.addTarget(self, action: #selector(self.showPassword), for: .touchUpInside)
        textfield.rightView = button
        textfield.rightViewMode = .always
    }
    
    
    @IBAction func showPassword(){
        print("Show password pressed")
    }
    
static func isPasswordValid(_ password : String) -> Bool {
    
    
    
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)
    
}

    static func ismailValid(_ email : String) -> Bool {
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: email)
        
    }
    
    static func styleButton(_ button : UIButton){
        //button.titleLabel?.font = UIFont(name: "Nexa Light", size: system)
        button.tintColor = UIColor(red:68/255, green:33/255, blue:224/255, alpha: 1)
    }
    
    
    
}
