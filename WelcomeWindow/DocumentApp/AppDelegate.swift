//
//  AppDelegate.swift
//  DocumentApp
//
//  Created by Lucas Derraugh on 5/7/21.
//

import Cocoa
import WelcomeFramework

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var windowController = WelcomeWindowController(configuration: .defaultConfiguration())
    
    var documentController: DocumentController {
        return NSDocumentController.shared as! DocumentController
    }
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        _ = DocumentController()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if !documentController.hasOpenedDocument {
            windowController.showWindow()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        false
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            windowController.showWindow(force: true)
        }
        return true
    }
}

