//
//  MainWelcomeViewController.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/25/21.
//

import Cocoa

class MainWelcomeViewController: NSViewController {

    @IBOutlet private weak var closeButton: HoverButton!
    @IBOutlet private weak var showOnLaunchCheckBox: NSButton!
    
    @IBOutlet private weak var firstButton: NSButton!
    @IBOutlet private weak var secondButton: NSButton!
    @IBOutlet private weak var thirdButton: NSButton!
    
    private struct Button {
        let title: String
        let subtitle: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addTrackingArea(NSTrackingArea(rect: .zero, options: [.mouseEnteredAndExited, .activeAlways, .inVisibleRect], owner: self, userInfo: nil))
        
        setup()
    }
    
    private func setup() {
        showOnLaunchCheckBox.state = Defaults.showOnLaunch ? .on : .off
        
        let models = [
            Button(title: "Create a new Xcode project", subtitle: "Create an app for iPhone, iPad, Mac, Apple Watch, or Apple TV"),
            Button(title: "Clone an existing project", subtitle: "Start working on something from a Git repository."),
            Button(title: "Open a project or file", subtitle: "Open an existing project or file on your Mac.")
        ]
        
        let buttons: [NSButton] = [firstButton, secondButton, thirdButton]
        
        for (model, button) in zip(models, buttons) {
            let text = NSMutableAttributedString(string: "   \(model.title)\n   ", attributes: [
                .font: NSFont.boldSystemFont(ofSize: 13),
                .foregroundColor: NSColor.labelColor
            ])
            text.append(NSAttributedString(string: model.subtitle, attributes: [
                .font: NSFont.systemFont(ofSize: 12),
                .foregroundColor: NSColor.labelColor
            ]))
            
            button.attributedTitle = text
        }
    }
    
    override func mouseEntered(with event: NSEvent) {
        closeButton.alphaValue = 1
        showOnLaunchCheckBox.alphaValue = 1
    }
    
    override func mouseExited(with event: NSEvent) {
        closeButton.animator().alphaValue = 0
        showOnLaunchCheckBox.animator().alphaValue = 0
    }
    
    @IBAction private func closeWindow(_ sender: Any) {
        view.window?.close()
    }
    
    @IBAction func showOnLaunchClicked(_ sender: NSButton) {
        Defaults.showOnLaunch = sender.state == .on
    }
}
