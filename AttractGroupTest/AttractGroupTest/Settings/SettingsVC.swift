//
//  SettingsViewController.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/3/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let menuView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Setings"
        
        self.menuView.index = 2
        self.menuView.delegate = self
        self.menuView.setupUI(position: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.menuView.openMenu()
    }
}
