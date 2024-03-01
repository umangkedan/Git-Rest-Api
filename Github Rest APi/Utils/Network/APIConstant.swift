//
//  APIConstant.swift
//  APiDemo
//
//  Created by Inderpreet Singh on 28/02/24.
//

import Foundation


class APIConstant {
    
    enum API {
        case SignInWithPassword
        
        func name() -> String {
            switch self {
            case .SignInWithPassword:
                return "user"
            }
        }
        
        func baseUrl() -> String {
            switch self {
            case .SignInWithPassword:
                return "https://api.github.com/"
            }
        }
        
        func apiUrl() -> String {
            return "\(baseUrl())\(name())"
        }
    }
}
