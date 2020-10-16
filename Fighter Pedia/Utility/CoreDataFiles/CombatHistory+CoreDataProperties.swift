//
//  CombatHistory+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 13/10/2020.
//
//

import Foundation
import CoreData


extension CombatHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CombatHistory> {
        return NSFetchRequest<CombatHistory>(entityName: "CombatHistory")
    }

    @NSManaged public var history: String?
    @NSManaged public var fighter: Fighter?

}

extension CombatHistory : Identifiable {

}
