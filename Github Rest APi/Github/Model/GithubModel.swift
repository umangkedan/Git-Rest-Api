//
//  GithubModel.swift
//  Github Rest APi
//
//  Created by Umang on 01/03/24.
//

import Foundation

//struct GitHubUser: Codable {
//    var name: String?
//    var bio: String?
//    var avatar_url: String?
//    var email: String?
//    var login: String?
//    var followers: Int?
//    var following:Int?
//    var location:String?
//    var public_repos:Int?
//    var total_private_repos:Int?
//    
//}

class GithubModel:NSObject {
    func logIN(token: String, completionHandler: @escaping (_ isSucceeded: Bool, _ data: GitHubUser?, _ error: String?) -> ()) {
        
        Network.connectWithServer(url: APIConstant.API.SignInWithPassword.apiUrl(), httpRequest: .GET, token: token) { isSucceeded, data, error, statusCode  in
            if isSucceeded {
                if statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let usableData = try decoder.decode(GitHubUser.self, from: data!)
                        completionHandler(true, usableData, nil)
                    } catch {
                        if Debug.shared.is_DEBUG {
                            print(error.localizedDescription)
                        }
                        completionHandler(false, nil, error.localizedDescription)
                    }
                } else if statusCode == 403 {
                    completionHandler(false, nil, "Forbidden")
                } else {
                    completionHandler(false, nil, "Unknown status code recieved Error:\(statusCode ?? 0)")
                }
            } else {
                completionHandler(false, nil, error)
            }
        }
    }
}
