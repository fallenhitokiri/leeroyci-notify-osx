//
//  AppDelegate.swift
//  leeroyNotify
//
//  Created by Timo Zimmermann on 26.09.15.
//  Copyright © 2015 Timo Zimmermann. All rights reserved.
//

import Cocoa
import Starscream


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, WebSocketDelegate, NSUserNotificationCenterDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    var config: Config = Config()
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    var websocket: WebSocket = WebSocket(url: NSURL(scheme: "ws", host: "localhost", path: "/")!)
    
    // App Delegate


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "statusIcon")
        icon?.template = true
        statusItem.image = icon
        statusItem.menu = statusMenu
        self.config.load()
        self.socketConnection()
    }

    func applicationWillTerminate(aNotification: NSNotification) {}


    // pragma: StatusBar Icon Actions
    
    
    @IBAction func exitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }

    
    func reload() {
        self.config.load()
        self.socketConnection()
    }
    
    func socketConnection() {
        self.websocket = WebSocket(url: NSURL(scheme: "ws", host: "localhost:8082", path: "/websocket")!)
        websocket.delegate = self
        websocket.connect()
    }
    
    
    // pragma mark: WebsocketDelegate
    
    
    func websocketDidConnect(socket: WebSocket) {
        print("connected")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print(error)
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: NSData) {}
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        let message = Message(json: text)
        self.notify(message)
    }
    
    
    // pragma mark: Notification
    
    
    func notify(message: Message) {
        let notification:NSUserNotification = NSUserNotification()
        notification.title = "Build: " + message.status
        notification.informativeText = "repository: " + message.repository + "\nbranch: " + message.branch
        notification.actionButtonTitle = "Show"
        notification.hasActionButton = true

        let center:NSUserNotificationCenter = NSUserNotificationCenter.defaultUserNotificationCenter()
        center.delegate = self
        center.scheduleNotification(notification)
    }
    
    
    // pragma: Delegate


    func userNotificationCenter(center: NSUserNotificationCenter, didActivateNotification notification: NSUserNotification) {
        print(notification)
    }
}
