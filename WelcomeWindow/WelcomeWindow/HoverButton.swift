//
//  HoverButton.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/15/21.
//

import Cocoa

class HoverButton: NSButton {
    
    /// Image used when hovering over
    @IBInspectable var hoveringImage: NSImage?
    @IBInspectable var notHoveringImage: NSImage? {
        didSet {
            image = notHoveringImage
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        addTrackingArea()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addTrackingArea()
    }
    
    private func addTrackingArea() {
        addTrackingArea(NSTrackingArea(rect: .zero, options: [.mouseEnteredAndExited, .activeAlways, .inVisibleRect], owner: self, userInfo: nil))
    }
    
    override func mouseEntered(with event: NSEvent) {
        image = hoveringImage
    }
    
    override func mouseExited(with event: NSEvent) {
        image = notHoveringImage
    }
}
