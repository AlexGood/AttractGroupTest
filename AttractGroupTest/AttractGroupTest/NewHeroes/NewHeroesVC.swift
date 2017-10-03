//
//  NewHeroesViewController.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/3/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class NewHeroesViewController: UIViewController {

    let menuView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "New Heroes"
        
        self.menuView.index = 1
        self.menuView.delegate = self
        self.menuView.setupUI(position: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.menuView.openMenu()
    }
}
