//
//  AppDelegate.swift
//  leeroyNotify
//
//  Created by Timo Zimmermann on 26.09.15.
//  Copyright © 2015 Timo Zimmermann. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    var config: Config = Config()
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)

    
    // App Delegate


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "statusIcon")
        icon?.template = true
        statusItem.image = icon
        statusItem.menu = statusMenu
        self.config.load()
    }

    func applicationWillTerminate(aNotification: NSNotification) {}


    // pragma: StatusBar Icon Actions
    
    
    @IBAction func exitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }

    
    func reload() {
        self.config.load()
    }
}
