//
//  FlightOperator+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 12/10/2020.
//
//

import Foundation
import CoreData


extension FlightOperator {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlightOperator> {
        return NSFetchRequest<FlightOperator>(entityName: "FlightOperator")
    }

    @NSManaged public var countryName: String?
    @NSManaged public var countryFlag: String?
    @NSManaged public var fighter: NSSet?

}

// MARK: Generated accessors for fighter
extension FlightOperator {

    @objc(addFighterObject:)
    @NSManaged public func addToFighter(_ value: Fighter)

    @objc(removeFighterObject:)
    @NSManaged public func removeFromFighter(_ value: Fighter)

    @objc(addFighter:)
    @NSManaged public func addToFighter(_ values: NSSet)

    @objc(removeFighter:)
    @NSManaged public func removeFromFighter(_ values: NSSet)

}

extension FlightOperator : Identifiable {

}
