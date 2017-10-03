//
//  Session.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class Session {
    func sessionRequest(data: NSDictionary, to: String, method: String, completionHandler: @escaping (NSArray?, Error?) -> Void) -> URLSessionDataTask {
        let url = URL(string: "\(AppConstants.api)\(to)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        
        print(url!)
        var request = URLRequest(url:url!)
        request.httpMethod = method
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                if error.localizedDescription == "cancelled" {
                    print("cancelled request")
                } else {
                    print("error=\(String(describing: error))")
                    OperationQueue.main.addOperation {
                        completionHandler(nil, error);
                    }
                }
            } else {
                do {
                    let result = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSArray
                    OperationQueue.main.addOperation {
                        completionHandler(result, nil)
                    }
                } catch {
                    print(error)
                    OperationQueue.main.addOperation {
                        completionHandler(nil, error)
                    }
                }
                
            }
        }
        
        task.resume()
        
        return task
    }
}
