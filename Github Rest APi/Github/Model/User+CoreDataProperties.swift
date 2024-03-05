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

    @NSManaged public var users: NSObject?

}

extension User : Identifiable {

}
