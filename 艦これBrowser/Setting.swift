//
//  Setting.swift
//  艦これBrowser
//
//  Created by Ming Chang on 5/17/20.
//  Copyright © 2020 Ming Chang. All rights reserved.
//

import Foundation

class Setting {
    
    private static let kdefaultLogin = "DefaultLoginMethod"
    
    static func getdefaultLogin() -> Int {
        return UserDefaults.standard.integer(forKey: kdefaultLogin)
    }
    
    static func savedefaultLogin(value: Int) {
        UserDefaults.standard.set(value, forKey: kdefaultLogin)
    }
    
}
