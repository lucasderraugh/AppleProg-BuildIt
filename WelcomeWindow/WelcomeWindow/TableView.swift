//
//  TableView.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/20/21.
//

import Cocoa

/// Handles return key events through `doubleAction`.
class TableView: NSTableView {
    
    override func keyDown(with event: NSEvent) {
        if event.characters?.count == 1, event.keyCode == 36 {
            sendAction(doubleAction, to: target)
        } else {
            super.keyDown(with: event)
        }
    }
}
