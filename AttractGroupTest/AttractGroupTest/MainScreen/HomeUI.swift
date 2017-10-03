//
//  MainUI.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

extension HomeViewController {
    func setupUI(){
        self.view.backgroundColor = .white
        
        self.tabBarController?.tabBar.isHidden = true
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(HomeCell.self, forCellReuseIdentifier: self.homeReuseId)
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(homeTableView)
        homeTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        homeTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        homeTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        homeTableView.tableFooterView = UIView()
        
        filterTextField = UITextField(frame: CGRect(x: 15, y: 17, width: AppConstants.screenWidth - 60, height: 20))
        filterTextField.placeholder = "Search..."
        filterTextField.backgroundColor = .white
        filterTextField.tintColor = .black
        filterTextField.layer.cornerRadius = 10
        filterTextField.addTarget(self, action: #selector(filter), for: .editingChanged)
        filterTextField.addTarget(self, action: #selector(changeFilterUI), for: .editingDidBegin)
        
        let paddingView = UIView(frame: CGRect(x: 0, y:0,width: 29,height: filterTextField.frame.height))
        filterTextField.leftView = paddingView
        filterTextField.leftViewMode = UITextFieldViewMode.always
        
        let searchImg = UIImageView()
        searchImg.image = #imageLiteral(resourceName: "search")
        searchImg.translatesAutoresizingMaskIntoConstraints = false
        paddingView.addSubview(searchImg)
        searchImg.centerXAnchor.constraint(equalTo: paddingView.centerXAnchor).isActive = true
        searchImg.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor).isActive = true
        searchImg.widthAnchor.constraint(equalToConstant: 13).isActive = true
        searchImg.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        self.navigationItem.titleView = filterTextField
    }
}
