//
//  InterestingFacts+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 12/10/2020.
//
//

import Foundation
import CoreData


extension InterestingFacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InterestingFacts> {
        return NSFetchRequest<InterestingFacts>(entityName: "InterestingFacts")
    }

    @NSManaged public var fact: String?
    @NSManaged public var fighter: Fighter?

}

extension InterestingFacts : Identifiable {

}
