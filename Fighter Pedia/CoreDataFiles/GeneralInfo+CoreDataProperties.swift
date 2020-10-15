//
//  GeneralInfo+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 13/10/2020.
//
//

import Foundation
import CoreData


extension GeneralInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeneralInfo> {
        return NSFetchRequest<GeneralInfo>(entityName: "GeneralInfo")
    }

    @NSManaged public var designedBy: String?
    @NSManaged public var firstFlight: Date?
    @NSManaged public var introduced: Int32
    @NSManaged public var manufacturer: String?
    @NSManaged public var numberBuilt: NSDecimalNumber?
    @NSManaged public var retired: String?
    @NSManaged public var role: String?
    @NSManaged public var fighter: Fighter?
    @NSManaged public var primaryUser: NSSet?

}

// MARK: Generated accessors for primaryUser
extension GeneralInfo {

    @objc(addPrimaryUserObject:)
    @NSManaged public func addToPrimaryUser(_ value: PrimaryUser)

    @objc(removePrimaryUserObject:)
    @NSManaged public func removeFromPrimaryUser(_ value: PrimaryUser)

    @objc(addPrimaryUser:)
    @NSManaged public func addToPrimaryUser(_ values: NSSet)

    @objc(removePrimaryUser:)
    @NSManaged public func removeFromPrimaryUser(_ values: NSSet)

}

extension GeneralInfo : Identifiable {

}
