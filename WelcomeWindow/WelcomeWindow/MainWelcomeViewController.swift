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
    
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var subtitleLabel: NSTextField!
    @IBOutlet private weak var firstButton: NSButton!
    @IBOutlet private weak var secondButton: NSButton!
    @IBOutlet private weak var thirdButton: NSButton!
    
    let configuration: WelcomeConfiguration
    
    private struct Button {
        let title: String
        let subtitle: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addTrackingArea(NSTrackingArea(rect: .zero, options: [.mouseEnteredAndExited, .activeAlways, .inVisibleRect], owner: self, userInfo: nil))
        
        setup()
    }
    
    public init(configuration: WelcomeConfiguration) {
        self.configuration = configuration
        super.init(nibName: NSNib.Name(String(describing: Self.self)), bundle: .framework)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        imageView.image = configuration.image
        titleLabel.stringValue = configuration.title
        subtitleLabel.stringValue = configuration.subtitle
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
