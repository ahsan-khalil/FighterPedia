//
//  Fighter+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 13/10/2020.
//
//

import Foundation
import CoreData


extension Fighter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fighter> {
        return NSFetchRequest<Fighter>(entityName: "Fighter")
    }

    @NSManaged public var flightName: String?
    @NSManaged public var armamentList: NSSet?
    @NSManaged public var combatHistoryList: NSSet?
    @NSManaged public var flightOperatorsList: NSSet?
    @NSManaged public var generalCharacterislticslist: NSSet?
    @NSManaged public var generalInfo: GeneralInfo?
    @NSManaged public var interestingFactsList: NSSet?
    @NSManaged public var performanceList: NSSet?
    @NSManaged public var picturesList: NSSet?

}

// MARK: Generated accessors for armamentList
extension Fighter {

    @objc(addArmamentListObject:)
    @NSManaged public func addToArmamentList(_ value: Armament)

    @objc(removeArmamentListObject:)
    @NSManaged public func removeFromArmamentList(_ value: Armament)

    @objc(addArmamentList:)
    @NSManaged public func addToArmamentList(_ values: NSSet)

    @objc(removeArmamentList:)
    @NSManaged public func removeFromArmamentList(_ values: NSSet)

}

// MARK: Generated accessors for combatHistoryList
extension Fighter {

    @objc(addCombatHistoryListObject:)
    @NSManaged public func addToCombatHistoryList(_ value: CombatHistory)

    @objc(removeCombatHistoryListObject:)
    @NSManaged public func removeFromCombatHistoryList(_ value: CombatHistory)

    @objc(addCombatHistoryList:)
    @NSManaged public func addToCombatHistoryList(_ values: NSSet)

    @objc(removeCombatHistoryList:)
    @NSManaged public func removeFromCombatHistoryList(_ values: NSSet)

}

// MARK: Generated accessors for flightOperatorsList
extension Fighter {

    @objc(addFlightOperatorsListObject:)
    @NSManaged public func addToFlightOperatorsList(_ value: FlightOperator)

    @objc(removeFlightOperatorsListObject:)
    @NSManaged public func removeFromFlightOperatorsList(_ value: FlightOperator)

    @objc(addFlightOperatorsList:)
    @NSManaged public func addToFlightOperatorsList(_ values: NSSet)

    @objc(removeFlightOperatorsList:)
    @NSManaged public func removeFromFlightOperatorsList(_ values: NSSet)

}

// MARK: Generated accessors for generalCharacterislticslist
extension Fighter {

    @objc(addGeneralCharacterislticslistObject:)
    @NSManaged public func addToGeneralCharacterislticslist(_ value: GeneralCharacteristics)

    @objc(removeGeneralCharacterislticslistObject:)
    @NSManaged public func removeFromGeneralCharacterislticslist(_ value: GeneralCharacteristics)

    @objc(addGeneralCharacterislticslist:)
    @NSManaged public func addToGeneralCharacterislticslist(_ values: NSSet)

    @objc(removeGeneralCharacterislticslist:)
    @NSManaged public func removeFromGeneralCharacterislticslist(_ values: NSSet)

}

// MARK: Generated accessors for interestingFactsList
extension Fighter {

    @objc(addInterestingFactsListObject:)
    @NSManaged public func addToInterestingFactsList(_ value: InterestingFacts)

    @objc(removeInterestingFactsListObject:)
    @NSManaged public func removeFromInterestingFactsList(_ value: InterestingFacts)

    @objc(addInterestingFactsList:)
    @NSManaged public func addToInterestingFactsList(_ values: NSSet)

    @objc(removeInterestingFactsList:)
    @NSManaged public func removeFromInterestingFactsList(_ values: NSSet)

}

// MARK: Generated accessors for performanceList
extension Fighter {

    @objc(addPerformanceListObject:)
    @NSManaged public func addToPerformanceList(_ value: Performance)

    @objc(removePerformanceListObject:)
    @NSManaged public func removeFromPerformanceList(_ value: Performance)

    @objc(addPerformanceList:)
    @NSManaged public func addToPerformanceList(_ values: NSSet)

    @objc(removePerformanceList:)
    @NSManaged public func removeFromPerformanceList(_ values: NSSet)

}

// MARK: Generated accessors for picturesList
extension Fighter {

    @objc(addPicturesListObject:)
    @NSManaged public func addToPicturesList(_ value: Picture)

    @objc(removePicturesListObject:)
    @NSManaged public func removeFromPicturesList(_ value: Picture)

    @objc(addPicturesList:)
    @NSManaged public func addToPicturesList(_ values: NSSet)

    @objc(removePicturesList:)
    @NSManaged public func removeFromPicturesList(_ values: NSSet)

}

extension Fighter : Identifiable {

}
