//
//  Debug.swift
//  APiDemo
//
//  Created by Umang on 29/02/24.
//

import Foundation

class Debug:NSObject {
    let is_DEBUG = true
    
    static let shared = Debug()
    
    func getBoolValue() -> Bool {
        return is_DEBUG
    }
}
