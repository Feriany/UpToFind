//
//  MenuOptionCell.swift
//  
//
//  Created by Mohamed RHIMI on 12/2/19.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    // MARK:-Properties
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let descriptionLable : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Simple Text"
        
        return label
    }()
    // MARK:-Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red:27/255, green:14/255, blue:85/255, alpha: 1)
        selectionStyle = .none
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(descriptionLable)
       descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLable.leftAnchor.constraint(equalTo: iconImageView.rightAnchor,constant: 12).isActive = true
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK:-Handlers

}
