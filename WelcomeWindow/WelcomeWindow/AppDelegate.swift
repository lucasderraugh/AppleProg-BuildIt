//
//  AppDelegate.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/25/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var welcomeWindowController = WelcomeWindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        welcomeWindowController.showWindow(force: true)
    }
}

