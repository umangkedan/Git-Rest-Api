//
//  UserModel.swift
//  Github Rest APi
//
//  Created by Umang Kedan on 04/03/24.
//

import UIKit
import CoreData
import UIKit


struct GitHubUser: Codable {
    var name: String?
    var bio: String?
    var avatar_url: String?
    var email: String?
    var login: String?
    var followers: Int?
    var following:Int?
    var location:String?
    var public_repos:Int?
    var total_private_repos:Int?
    
}

class UserModel: NSObject {
    let gitModel = GithubModel()
    
    static let managedObjectContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to access AppDelegate")
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    func saveUser(gitHubUser: GitHubUser) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Unable to access AppDelegate")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let newUser = User(context: context)
        
        newUser.name = gitHubUser.name
        newUser.avatar_url = gitHubUser.avatar_url
        newUser.bio = gitHubUser.bio
        newUser.email = gitHubUser.email
        newUser.followers = Int16(gitHubUser.followers ?? 0)
        newUser.following = Int16(gitHubUser.following ?? 0)
        newUser.location = gitHubUser.location
        newUser.public_repos = Int16(gitHubUser.public_repos ?? 0)
        newUser.total_private_repos = Int16(gitHubUser.total_private_repos ?? 0)
        newUser.login = gitHubUser.login
        
        do {
            try context.save()
            print("User saved successfully")
        } catch {
            print("Error saving user: \(error.localizedDescription)")
        }
    }
    
    func fetchUser(completion: @escaping ([User]?, Error?) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(nil, NSError(domain: "Github Rest APi", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to access AppDelegate"]))
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            print("Users fetched successfully")
            completion(users, nil)
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
            completion(nil, error)
        }
    }
}


