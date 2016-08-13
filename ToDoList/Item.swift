//
//  Item.swift
//  ToDoList
//
//  Created by Shijie Li on 8/10/16.
//  Copyright © 2016 Shijie Li. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    var name: String
    static let Dir = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = Dir.URLByAppendingPathComponent("items")
    
    init(name: String){
        self.name = name
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey:  "name")
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let name = aDecoder.decodeObjectForKey("name") as! String
        self.init(name: name)
    }
}