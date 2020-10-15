//
//  UserPreferences+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 13/10/2020.
//
//

import Foundation
import CoreData


extension UserPreferences {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPreferences> {
        return NSFetchRequest<UserPreferences>(entityName: "UserPreferences")
    }

    @NSManaged public var backgroundImage: String?

}

extension UserPreferences : Identifiable {

}
