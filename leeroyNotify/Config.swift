//
//  Config.swift
//  leeroyNotify
//
//  Created by Timo Zimmermann on 27.09.15.
//  Copyright © 2015 Timo Zimmermann. All rights reserved.
//

import Foundation

struct Config {
    var username = ""
    var accessKey = ""
    var server = ""
    var email = ""
    
    func save() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setValue(self.username, forKey: "username")
        defaults.setValue(self.accessKey, forKey: "accesskey")
        defaults.setValue(self.server, forKey: "server")
        defaults.setValue(self.email, forKey: "email")
    }
    
    mutating func load() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let username = defaults.objectForKey("username") as? String {
            self.username = username
        }
        
        if let accesskey = defaults.objectForKey("accesskey") as? String {
            self.accessKey = accesskey
        }
        
        if let server = defaults.objectForKey("server") as? String {
            self.server = server
        }
        
        if let email = defaults.objectForKey("email") as? String {
            self.email = email
        }
    }
}
