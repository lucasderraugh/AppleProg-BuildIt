//
//  WelcomeWindowController.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/25/21.
//

import Cocoa

public class WelcomeWindowController: NSWindowController {
    
    var configuration = WelcomeConfiguration.defaultConfiguration()

    public override func windowDidLoad() {
        super.windowDidLoad()

        window?.isMovableByWindowBackground = true
        
        let splitViewController = SplitViewController()
        splitViewController.addSplitViewItem(NSSplitViewItem(viewController: MainWelcomeViewController(configuration: configuration)))
        splitViewController.addSplitViewItem(NSSplitViewItem(viewController: RecentsTableViewController(urls: NSDocumentController.shared.recentDocumentURLs)))
        contentViewController = splitViewController
    }
    
    public convenience init(configuration: WelcomeConfiguration) {
        Defaults.registerDefaults()
        
        self.init(windowNibName: NSNib.Name(String(describing: Self.self)))
        self.configuration = configuration
    }
    
    public func showWindow(force: Bool = false) {
        if force || Defaults.showOnLaunch {
            super.showWindow(nil)
        }
    }
    
    @available(*, unavailable)
    override public func showWindow(_ sender: Any?) {}
}
