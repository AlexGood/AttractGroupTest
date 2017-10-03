//
//  HomeCell.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    let img = UIImageView()
    let name = UILabel()
    let date = UILabel()
    let activityIndicator = UIActivityIndicatorView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.img.layer.cornerRadius = 25
        self.img.layer.masksToBounds = true
        self.img.contentMode = .scaleAspectFill
        self.img.layer.borderWidth = 2
        self.img.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.img)
        self.img.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.img.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 26).isActive = true
        self.img.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.img.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.name.textColor = .black
        self.name.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.name)
        self.name.centerYAnchor.constraint(equalTo: self.img.centerYAnchor).isActive = true
        self.name.leftAnchor.constraint(equalTo: self.img.rightAnchor, constant: 8).isActive = true
        
        self.date.textColor = .black
        self.date.font = UIFont.systemFont(ofSize: 13)
        self.date.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.date)
        self.date.centerYAnchor.constraint(equalTo: self.name.centerYAnchor).isActive = true
        self.date.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.img.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: img.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: img.centerYAnchor).isActive = true
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
    func loadImage(urlString: String, cellNum: Int) {
        if urlString != "" {
            let setcellNum = cellNum
            activityIndicator.startAnimating()
            FileDownloader().downloadImage(url: URL(string: "\(urlString)")!) { (UIImage, Error) in
                self.activityIndicator.stopAnimating()
                if Error == nil {
                    if setcellNum == cellNum{
                        self.img.image = UIImage
                    }
                } else {
                    NSLog("download failed")
                }
            }
        }
    }
}

