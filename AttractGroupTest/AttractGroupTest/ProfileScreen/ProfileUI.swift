//
//  ProfileUI.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

extension ProfileVC {
    func setupUI(){
        self.view.backgroundColor = .white
        
        img.layer.cornerRadius = 100
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFill
        img.layer.borderWidth = 2
        img.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(img)
        img.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        img.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90).isActive = true
        img.heightAnchor.constraint(equalToConstant: 200).isActive = true
        img.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.img.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: img.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: img.centerYAnchor).isActive = true
        
        self.nameLabel.text = self.record?.name
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.nameLabel)
        self.nameLabel.topAnchor.constraint(equalTo: self.img.bottomAnchor, constant: 40).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.descriptionLabel.text = self.record?.recordDescription
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.descriptionLabel)
        self.descriptionLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 40).isActive = true
        self.descriptionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        self.descriptionLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15).isActive = true
        self.descriptionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
