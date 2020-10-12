//
//  PrimaryUser+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 12/10/2020.
//
//

import Foundation
import CoreData


extension PrimaryUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PrimaryUser> {
        return NSFetchRequest<PrimaryUser>(entityName: "PrimaryUser")
    }

    @NSManaged public var username: String?
    @NSManaged public var generalInfo: NSSet?

}

// MARK: Generated accessors for generalInfo
extension PrimaryUser {

    @objc(addGeneralInfoObject:)
    @NSManaged public func addToGeneralInfo(_ value: GeneralInfo)

    @objc(removeGeneralInfoObject:)
    @NSManaged public func removeFromGeneralInfo(_ value: GeneralInfo)

    @objc(addGeneralInfo:)
    @NSManaged public func addToGeneralInfo(_ values: NSSet)

    @objc(removeGeneralInfo:)
    @NSManaged public func removeFromGeneralInfo(_ values: NSSet)

}

extension PrimaryUser : Identifiable {

}
