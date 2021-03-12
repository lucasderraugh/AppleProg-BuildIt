//
//  FileTableCellView.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/20/21.
//

import Cocoa

class FileTableCellView: NSTableCellView {
    
    /// Both imageView and textField are linked
    @IBOutlet private weak var subtitleLabel: NSTextField!

    func configure(with url: URL) {
        imageView?.image = NSWorkspace.shared.icon(forFile: url.path)
        textField?.stringValue = url.deletingPathExtension().lastPathComponent
        subtitleLabel.stringValue = (url.deletingLastPathComponent().path as NSString).abbreviatingWithTildeInPath
    }
}
