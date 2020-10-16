//
//  Performance+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 13/10/2020.
//
//

import Foundation
import CoreData


extension Performance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Performance> {
        return NSFetchRequest<Performance>(entityName: "Performance")
    }

    @NSManaged public var detail: String?
    @NSManaged public var title: String?
    @NSManaged public var fighter: Fighter?

}

extension Performance : Identifiable {

}
