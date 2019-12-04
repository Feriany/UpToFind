//
//  ButView.swift
//  UpToFind
//
//  Created by Mohamed RHIMI on 12/1/19.
//  Copyright © 2019 Mohamed RHIMI. All rights reserved.
//

import UIKit

class ButView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
   

    struct Colors {
        static let tropicBlue = UIColor(red:111/255, green: 82/255, blue: 240/255, alpha: 1)
    }


    struct Fonts {
        static let avenirNextCondensedDemiBold = "NexaLight"
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        backgroundColor     = Colors.tropicBlue
        titleLabel?.font    = UIFont(name: Fonts.avenirNextCondensedDemiBold, size: 22)
        layer.cornerRadius  = frame.size.height/2
        setTitleColor(.white, for: .normal)
    }
}
