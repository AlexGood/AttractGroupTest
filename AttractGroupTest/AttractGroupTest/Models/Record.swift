//
//  Record.swift
//  AttractGroupTest
//
//  Created by Alexandr Kudlak on 10/2/17.
//  Copyright © 2017 Alexandr Kudlak. All rights reserved.
//

import UIKit
import RealmSwift

class Record: Object {
    @objc dynamic var id = Int()
    @objc dynamic var name = String()
    @objc dynamic var imageURL = String()
    @objc dynamic var recordDescription = String()
    @objc dynamic var date = Date()
    
    static func toRealm(data: NSDictionary) -> Record {
        let realm = try! Realm()
        
        let recordId = Int(((data["itemId"] as! NSString) as String))!
        var record: Record
        let recordOptional = realm.objects(Record.self).filter("id = \(recordId)").first
        if let recordObj = recordOptional {
            record = recordObj
        } else {
            record = Record()
            record.id = recordId
        }
        
        try! realm.write {
            if let name = data["name"] as? String{
                record.name = name
            }
            if let imageURL = data["image"] as? String {
                record.imageURL = imageURL
            }
            if let recordDescription = data["description"] as? String {
                record.recordDescription = recordDescription
            }
            //why I get this?
            //"time":"1457018837658"
            //it's not a time or I just don't know something
//            if let date = data["time"] as? Data{
//                record.date = date
//            }
            realm.add(record)
        }
        
        return record
    }
    
    static func getRecords(completionHandler: @escaping ([Record]?, String?) -> Void) -> Void{
        _ = Session().sessionRequest(data: [:], to: "/test.json", method: "GET", completionHandler: {(result, error) in
            if let results = result{
                var recordsArray = [Record]()
                for object in results{
                    let record = Record.toRealm(data: object as! NSDictionary)
                    recordsArray.append(record)
                }
                completionHandler(recordsArray, nil)
            } else if let error = error {
                completionHandler(nil, error.localizedDescription)
            }
        })
    }
}
