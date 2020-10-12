//
//  Armament+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 12/10/2020.
//
//

import Foundation
import CoreData


extension Armament {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Armament> {
        return NSFetchRequest<Armament>(entityName: "Armament")
    }

    @NSManaged public var armament: String?
    @NSManaged public var fighter: Fighter?

}

extension Armament : Identifiable {

}
