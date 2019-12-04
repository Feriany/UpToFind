//
//  MenuOption.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/2/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit

enum MenuOption :Int, CustomStringConvertible{
    
    
    case Home
    case FindObject
    case Profile
    case Notification
    case Contact
    case Setting
    case About
    case Logout
    
    
    var description : String {
        switch self {
            
        case .Home:
            return "Home"
        case .FindObject:
           return "FindObject"
        case .Profile:
           return "Profile"
        case .Notification:
           return "Notification"
        case .Contact:
           return "Contact"
            case .Setting:
               return "Setting"
            case .About:
               return "About"
            case .Logout:
               return "Logout"
    }
        
}
        var image : UIImage {
               switch self {
                   
               case .Home:
                return UIImage(named: "profile") ?? UIImage()
               case .FindObject:
                  return UIImage(named: "findoject") ?? UIImage()
               case .Profile:
                  return UIImage(named: "profils") ?? UIImage()
               case .Notification:
                  return UIImage(named: "notification") ?? UIImage()
               case .Contact:
                  return UIImage(named: "contact") ?? UIImage()
                case .Setting:
                   return UIImage(named: "setting") ?? UIImage()
                case .About:
                   return UIImage(named: "about") ?? UIImage()
                case .Logout:
                   return UIImage(named: "logout") ?? UIImage()
           }
}

}

