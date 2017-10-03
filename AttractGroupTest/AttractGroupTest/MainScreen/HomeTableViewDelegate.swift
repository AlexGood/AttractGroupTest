//
//  HomeViewController.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.homeReuseId, for: indexPath as IndexPath) as! HomeCell
        
        cell.loadImage(urlString: self.records[indexPath.row].imageURL, cellNum: indexPath.row)
        cell.name.text = self.records[indexPath.row].name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-YYYY HH:mm"
        let date = dateFormatter.string(from: self.records[indexPath.row].date)
        
        cell.date.text = date
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.records.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = PageController()
        profileVC.index = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        self.switcher = false
        profileVC.records = self.records
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
}
