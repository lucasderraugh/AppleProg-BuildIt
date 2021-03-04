//
//  WelcomeWindowController.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/25/21.
//

import Cocoa

class WelcomeWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        window?.isMovableByWindowBackground = true
        
        let splitViewController = SplitViewController()
        splitViewController.addSplitViewItem(NSSplitViewItem(viewController: MainWelcomeViewController()))
        splitViewController.addSplitViewItem(NSSplitViewItem(viewController: RecentsTableViewController()))
        contentViewController = splitViewController
    }
    
    convenience init() {
        self.init(windowNibName: NSNib.Name(String(describing: Self.self)))
    }
}
