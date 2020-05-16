//
//  Setting.swift
//  艦これBrowser
//
//  Created by Ming Chang on 5/14/20.
//  Copyright © 2020 Ming Chang. All rights reserved.
//

import Foundation

class Setting {
    
    private static let keyLang = "Language" //Language Setting

    static func getLang() -> Int {
        return UserDefaults.standard.integer(forKey: keyLang)
    }

    static func saveLang(value: Int) {
        UserDefaults.standard.set(value, forKey: keyLang)
    }
    
    private static let keyHomepage = "Home" //Homepage

    static func getHomepage() -> Int {
        return UserDefaults.standard.integer(forKey: keyHomepage)
    }

    static func saveHomepage(value: Int) {
        UserDefaults.standard.set(value, forKey: keyHomepage)
    }
    
}
