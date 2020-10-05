//
//  Fighter.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 05/10/2020.
//

import Foundation

struct PrimaryUsers{
    var username:String
}


struct GeneralInfo {
    var role:String
    var manufacturer:String
    var designedBy:String
    var FirstFlight:Date
    var introduced:Int
    var retired:String
    var PrimaryUsers:[PrimaryUsers]
    var numberBuilt:String
}
struct InterestingFact {
    var facts:String
}
struct FlightOperator {
    var countryName:String
    var countryFlag:String!
}
struct GeneralCharachteristics{
    var title: String
    var detail: String
    
    
}
struct Performance{
    var title:String
    var detail:String
}
struct CombatHistory{
    var history:String
}

struct Armament{
    var armament:String
}

class Fighter{
    init(flightname: String = "Default", flightID: Int? = nil, flightStringId: String? = nil, generalInfo: GeneralInfo? = nil, interestingFactsList: [InterestingFact]? = nil, flightOperatorsList: [FlightOperator]? = nil, generalCharacteristicsList: [GeneralCharachteristics]? = nil, peromanceList: [Performance]? = nil, combatHistoryList: [CombatHistory]? = nil, armamentList: [Armament]? = nil, picturesList: [String]? = nil) {
        self.flightname = flightname
        self.flightID = flightID
        self.flightStringId = flightStringId
        self.generalInfo = generalInfo
        self.interestingFactsList = interestingFactsList
        self.flightOperatorsList = flightOperatorsList
        self.generalCharacteristicsList = generalCharacteristicsList
        self.peromanceList = peromanceList
        self.combatHistoryList = combatHistoryList
        self.armamentList = armamentList
        self.picturesList = picturesList
    }
    
    init(flightname:String){
        self.flightname = flightname
    }
    
    var flightname:String = "Default"
    var flightID:Int!
    var flightStringId:String!
    var generalInfo:GeneralInfo!
    var interestingFactsList:[InterestingFact]!
    var flightOperatorsList:[FlightOperator]!
    var generalCharacteristicsList:[GeneralCharachteristics]!
    var peromanceList:[Performance]!
    var combatHistoryList:[CombatHistory]!
    var armamentList:[Armament]!
    var picturesList:[String]!
    
    
    
}
