//
//  Defaults.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 4/22/21.
//

import Foundation

struct Defaults {
    static func registerDefaults() {
        UserDefaults.standard.register(defaults: [showOnLaunchKey: true])
    }
    
    private static let showOnLaunchKey = "WelcomeWindowShowOnLaunch"
    static var showOnLaunch: Bool {
        get {
            UserDefaults.standard.bool(forKey: showOnLaunchKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: showOnLaunchKey)
        }
    }
}
