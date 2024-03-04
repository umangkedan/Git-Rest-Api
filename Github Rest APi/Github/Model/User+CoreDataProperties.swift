//
//  User+CoreDataProperties.swift
//  Github Rest APi
//
//  Created by Umang Kedan on 04/03/24.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var total_private_repos: Int16
    @NSManaged public var public_repos: Int16
    @NSManaged public var location: String?
    @NSManaged public var following: Int16
    @NSManaged public var followers: Int16
    @NSManaged public var login: String?
    @NSManaged public var email: String?
    @NSManaged public var avatar_url: String?
    @NSManaged public var bio: String?
    @NSManaged public var name: String?

}

extension User : Identifiable {

}
