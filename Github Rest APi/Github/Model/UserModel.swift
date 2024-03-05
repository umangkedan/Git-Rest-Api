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
  
    static let managedObjectContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to access AppDelegate")
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    
    func saveUserToCoreData(user: GitHubUser) {
       
        let entity = NSEntityDescription.entity(forEntityName: "User", in: UserModel.managedObjectContext)!
        let userObject = NSManagedObject(entity: entity, insertInto: UserModel.managedObjectContext)
        
        do {
            // Serialize(encode) user object to Data
            let userData = try JSONEncoder().encode(user)
            print("Serialized Data: \(userData)")
            
            // Save Data to Core Data
            userObject.setValue(userData, forKeyPath: "users")
            
            // Save context
            try UserModel.managedObjectContext.save()
            print("User saved to Core Data successfully")
            
        } catch let error as NSError {
            print("Could not save user to Core Data. \(error), \(error.userInfo)")
        }
    }

    func fetchUserFromCoreData() -> [GitHubUser]? {
        
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            let count = try UserModel.managedObjectContext.count(for: fetchRequest)
            guard count > 0 else {
                print("No users found in Core Data.")
                return nil
            }
            
            let fetchedUsers = try UserModel.managedObjectContext.fetch(fetchRequest)
            var users: [GitHubUser] = []
            
            for userObject in fetchedUsers {
                if let userData = userObject.value(forKey: "users") as? Data {
                    print("Fetched Data: \(userData)")
                    // Decoce - Deserialize the user object from data
                    if let user = try? JSONDecoder().decode(GitHubUser.self, from: userData) {
                        print("Decoded User: \(user)")
                        users.append(user)
                    }
                }
            }
            return users
        } catch {
            print("Could not fetch users: \(error)")
            return nil
        }
    }
    
    
}

