//
//  GithubModel.swift
//  Github Rest APi
//
//  Created by Inderpreet Singh on 01/03/24.
//

import Foundation

struct GitHubUser: Codable {
    var name: String?
    var bio: String?
    var avatar_url: String?
}

class GithubModel:NSObject {
    func logIN(token: String, completionHandler: @escaping (_ isSucceeded: Bool, _ data: GitHubUser?, _ error: String?) -> ()) {
        
        Network.connectWithServer(url: APIConstant.API.SignInWithPassword.apiUrl(), httpRequest: .GET, token: token) { isSucceeded, data, error in
            if isSucceeded {
                do {
                    let decoder = JSONDecoder()
                    let usableData = try decoder.decode(GitHubUser.self, from: data!)
                    completionHandler(true, usableData, nil)
                } catch {
                    if Debug.shared.is_DEBUG {
                        let corruptData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                        print(corruptData)
                        print(error.localizedDescription)
                    }
                    completionHandler(false, nil, error.localizedDescription)
                }
            } else {
                completionHandler(false, nil, error)
            }
        }
    }
}
