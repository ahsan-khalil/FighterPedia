//
//  PrimaryUser+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 13/10/2020.
//
//

import Foundation
import CoreData


extension PrimaryUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PrimaryUser> {
        return NSFetchRequest<PrimaryUser>(entityName: "PrimaryUser")
    }

    @NSManaged public var username: String?
    @NSManaged public var generalInfo: GeneralInfo?

}

extension PrimaryUser : Identifiable {

}
