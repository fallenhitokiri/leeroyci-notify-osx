//
//  Message.swift
//  leeroyNotify
//
//  Created by Timo Zimmermann on 27.09.15.
//  Copyright © 2015 Timo Zimmermann. All rights reserved.
//

import Foundation


struct Message {
    var name = ""
    var email = ""
    var event = ""
    var repository = ""
    var branch = ""
    var status = ""
    
    init(json: String) {
        self.parse(json)
    }
    
    mutating func parse(json: String) {
        do {
            let parsed = try NSJSONSerialization.JSONObjectWithData(
                json.dataUsingEncoding(NSUTF8StringEncoding)!,
                options: NSJSONReadingOptions.AllowFragments
            )

            self.name = parsed["name"] as! String
            self.email = parsed["email"] as! String
            self.event = parsed["event"] as! String
            self.repository = parsed["repository_name"] as! String
            self.branch = parsed["branch"] as! String
            self.status = parsed["status"] as! String
        } catch let error as NSError {
            print(error)
        }
    }
}