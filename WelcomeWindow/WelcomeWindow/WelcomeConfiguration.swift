//
//  WelcomeConfiguration.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 5/7/21.
//

import AppKit

public struct WelcomeConfiguration {
    var image: NSImage?
    var title: String
    var subtitle: String
    
    public static func defaultConfiguration() -> Self {
        let main = Bundle.main
        return .init(image: main.icon, title: "Welcome to \(main.appName)", subtitle: "Version \(main.version)")
    }
}
