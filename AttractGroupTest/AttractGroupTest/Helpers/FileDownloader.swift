//
//  FileDownloader.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit

class FileDownloader {
    func downloadImage(url: URL, completion:@escaping (UIImage? , Error? ) -> ()) {
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        
        let request = NSMutableURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60)
        request.httpShouldHandleCookies = false
        request.httpMethod = "GET"
        
        let cachedResponse = URLCache.shared.cachedResponse(for: request as URLRequest)
        if cachedResponse?.data != nil {
            let image = UIImage(data: (cachedResponse?.data)!)
            completion(image, nil)
        } else {
            let task = session.dataTask(with: request as URLRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                // make sure we are on main thread
                OperationQueue.main.addOperation({
                    if error != nil {
                        NSLog("Failed to download image")
                        completion(nil, error)
                    } else {
                        let image = UIImage(data: data!)
                        completion(image, nil)
                    }
                })
            })
            task.resume()
        }
    }
}
