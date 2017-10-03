//
//  MenuViewController.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/3/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class MenuView: UIView {
    
    let menuView = UIView()
    var delegate = UIViewController()
    var homeLabel = UIButton()
    var newHeroesLabel = UIButton()
    var settingsLabel = UIButton()
    var index = Int()

    func setupUI(position: Bool){
        let leftBarButton = UIButton.init(type: .custom)
        leftBarButton.setImage(#imageLiteral(resourceName: "menu"), for: UIControlState.normal)
        leftBarButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 38)
        leftBarButton.addTarget(self, action: #selector(self.openMenu), for: .touchUpInside)
        leftBarButton.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        let restaurantBarButton = UIBarButtonItem.init(customView: leftBarButton)
        delegate.navigationItem.leftBarButtonItem = restaurantBarButton
        
        if position {
            self.menuView.frame = CGRect(x: 0, y: 0, width: AppConstants.screenWidth/2, height: AppConstants.screenHeight)
        } else {
            self.menuView.frame = CGRect(x: 0, y: 0, width: 0, height: AppConstants.screenHeight)
        }
        self.menuView.backgroundColor = .gray
        
        if position {
            self.homeLabel = UIButton(frame: CGRect(x: 10, y: 100, width: 100, height: 20))
        } else {
            self.homeLabel = UIButton(frame: CGRect(x: 10, y: 100, width: 0, height: 0))
        }
        self.homeLabel.setTitle("Home", for: .normal)
        self.homeLabel.setTitleColor(.black, for: .normal)
        self.homeLabel.contentHorizontalAlignment = .left
        self.homeLabel.tag = 0
        self.homeLabel.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        self.menuView.addSubview(homeLabel)
        
        if position {
            self.newHeroesLabel = UIButton(frame: CGRect(x: 10, y: 150, width: 100, height: 20))
        } else {
            self.newHeroesLabel = UIButton(frame: CGRect(x: 10, y: 150, width: 0, height: 0))
        }
        self.newHeroesLabel.setTitle("New Heroes", for: .normal)
        self.newHeroesLabel.setTitleColor(.black, for: .normal)
        self.newHeroesLabel.contentHorizontalAlignment = .left
        self.newHeroesLabel.tag = 1
        self.newHeroesLabel.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        self.menuView.addSubview(newHeroesLabel)
        
        if position {
            self.settingsLabel = UIButton(frame: CGRect(x: 10, y: 200, width: 100, height: 20))
        } else {
            self.settingsLabel = UIButton(frame: CGRect(x: 10, y: 200, width: 0, height: 0))
        }
        self.settingsLabel.setTitle("Settings", for: .normal)
        self.settingsLabel.contentHorizontalAlignment = .left
        self.settingsLabel.setTitleColor(.black, for: .normal)
        self.settingsLabel.tag = 2
        self.settingsLabel.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        self.menuView.addSubview(settingsLabel)
        
        delegate.view.addSubview(self.menuView)
    }
    
    @objc func openMenu(){
        UIView.animate(withDuration: 0.2, animations: {
            if self.menuView.frame.width == AppConstants.screenWidth/2{
                self.menuView.frame = CGRect(x: 0, y: 0, width: 0, height: AppConstants.screenHeight)
                self.homeLabel.frame = CGRect(x: 10, y: 100, width: 0, height: 0)
                self.newHeroesLabel.frame = CGRect(x: 10, y: 150, width: 0, height: 0)
                self.settingsLabel.frame = CGRect(x: 10, y: 200, width: 0, height: 0)
            } else {
                self.menuView.frame = CGRect(x: 0, y: 0, width: AppConstants.screenWidth/2, height: AppConstants.screenHeight)
                self.homeLabel.frame = CGRect(x: 10, y: 100, width: 100, height: 20)
                self.newHeroesLabel.frame = CGRect(x: 10, y: 150, width: 100, height: 20)
                self.settingsLabel.frame = CGRect(x: 10, y: 200, width: 100, height: 20)
            }
        }, completion: nil)
    }
    
    @objc func menuAction(sender: UIButton){
        if self.index == sender.tag {
            self.openMenu()
        } else {
            if sender.tag == 0 {
                self.delegate.tabBarController?.selectedIndex = 0
            } else if sender.tag == 1 {
                self.delegate.tabBarController?.selectedIndex = 1
            } else if sender.tag == 2 {
                self.delegate.tabBarController?.selectedIndex = 2
            }
        }
    }
}
