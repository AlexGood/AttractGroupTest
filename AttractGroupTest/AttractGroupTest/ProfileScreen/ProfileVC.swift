//
//  ProfileVC.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    var record: Record? = nil
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let activityIndicator = UIActivityIndicatorView()
    let img = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        if let imageURL = self.record?.imageURL{
            self.loadImage(urlString: imageURL)
        }
    }
    
    func loadImage(urlString: String) {
        if urlString != "" {
            activityIndicator.startAnimating()
            FileDownloader().downloadImage(url: URL(string: "\(urlString)")!) { (UIImage, Error) in
                self.activityIndicator.stopAnimating()
                if Error == nil {
                    self.img.image = UIImage
                } else {
                    NSLog("download failed")
                }
            }
        }
    }
}
