//
//  ModelController.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class ModelController: NSObject, UIPageViewControllerDataSource {
    
    var records = [Record]()
    
    override init() {
        super.init()
    }
    
    func viewControllerAtIndex(_ index: Int) -> ProfileVC? {
        // Return the data view controller for the given index.
        if (self.records.count == 0) || (index >= self.records.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let profileVC = ProfileVC()
        profileVC.record = self.records[index]
        return profileVC
    }
    
    func indexOfViewController(_ viewController: ProfileVC) -> Int {
        return self.records.index(of: viewController.record!) ?? NSNotFound
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ProfileVC)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ProfileVC)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.records.count {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
}
