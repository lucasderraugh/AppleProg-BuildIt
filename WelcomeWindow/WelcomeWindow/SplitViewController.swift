//
//  SplitViewController.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/25/21.
//

import Cocoa

final class SplitViewController: NSSplitViewController {
    
    override func loadView() {
        let splitView = SplitView()
        splitView.isVertical = true
        self.splitView = splitView
        super.loadView()
    }
    
    override func splitView(_ splitView: NSSplitView, effectiveRect proposedEffectiveRect: NSRect, forDrawnRect drawnRect: NSRect, ofDividerAt dividerIndex: Int) -> NSRect {
        .zero
    }
}

final class SplitView: NSSplitView {
    override var dividerThickness: CGFloat {
        0
    }
}
