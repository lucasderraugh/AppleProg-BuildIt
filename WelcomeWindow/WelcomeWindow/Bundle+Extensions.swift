//
//  Bundle+Extensions.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 4/21/21.
//

import AppKit

extension Bundle {
    static let framework = Bundle(identifier: "com.lucasderraugh.WelcomeFramework")
    
    public var icon: NSImage? {
        guard let name = infoDictionary?["CFBundleIconName"] as? String else {
            return nil
        }
        return NSImage(named: name)
    }
    
    public var appName: String {
        infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    public var version: String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
}
