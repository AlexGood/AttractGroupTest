//
//  ViewController.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    let homeTableView = UITableView()
    let homeReuseId = "homeCell"
    var records = [Record]()
    var filterTextField = UITextField()
    let menuView = MenuView()
    var switcher = true
    var firstTime = true
    
    let filterTextFieldTop = NSLayoutConstraint()
    let filterTextFieldbottom = NSLayoutConstraint()
    let filterTextFieldLeft = NSLayoutConstraint()
    let filterTextFieldRight = NSLayoutConstraint()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuView.index = 0
        self.menuView.delegate = self
        
        self.setupUI()
        self.getRecords()
        self.menuView.setupUI(position: false)
    }
    
    func getRecords(){
        Record.getRecords() { (records, error) in
            if let records = records {
                self.records = records
                self.homeTableView.reloadData()
            }
        }
    }
    
    @objc func filter(){
        let realm = try! Realm()
        
        self.records = Array(realm.objects(Record.self).filter("name CONTAINS[c] '\(self.filterTextField.text!)'"))
        self.homeTableView.reloadData()
    }
    
    @objc func changeFilterUI(){
        UIView.animate(withDuration: 0.2, animations: {
            self.filterTextField.frame.size.width = AppConstants.screenWidth - 60
        }, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.switcher {
            if firstTime == false {
                self.menuView.openMenu()
            } else {
                self.firstTime = false
            }
        } else {
            self.switcher = true
        }
    }
}

