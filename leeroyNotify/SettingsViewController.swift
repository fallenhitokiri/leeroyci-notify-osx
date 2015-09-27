//
//  ViewController.swift
//  leeroyNotify
//
//  Created by Timo Zimmermann on 26.09.15.
//  Copyright © 2015 Timo Zimmermann. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {

    @IBOutlet weak var saveButton: NSButton!
    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var accessKeyTextField: NSTextField!
    @IBOutlet weak var serverTextField: NSTextField!
    @IBOutlet weak var emailTextField: NSTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        self.usernameTextField.objectValue = appDelegate.config.username
        self.accessKeyTextField.objectValue = appDelegate.config.accessKey
        self.serverTextField.objectValue = appDelegate.config.server
        self.emailTextField.objectValue = appDelegate.config.email
    }
    
    @IBAction func savePressed(sender: AnyObject) {
        let username = usernameTextField.objectValue as! String
        let accessKey = accessKeyTextField.objectValue as! String
        let server = serverTextField.objectValue as! String
        let email = emailTextField.objectValue as! String
        
        var config = Config()
        config.username = username
        config.accessKey = accessKey
        config.server = server
        config.email = email
        config.save()
        
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.reload()
    }
}

