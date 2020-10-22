//
//  Fighter.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 05/10/2020.
//

import Foundation
struct PrimaryUsersModel {
    var username: String
}
struct KeyValuePair {
    var title: String
    var detail: String
}
struct GeneralInfoModel {
    var role: String
    var manufacturer: String
    var designedBy: String
    var firstFlight: Date
    var introduced: Int
    var retired: String
    var primaryUsers: [PrimaryUsersModel]
    var numberBuilt: String
}
struct InterestingFactModel {
    var facts: String
}
struct FlightOperatorModel {
    var countryName: String
    var countryFlag: String!
}
struct GeneralCharachteristicsModel {
    var title: String
    var detail: String
}
struct PerformanceModel {
    var title: String
    var detail: String
}
struct CombatHistoryModel {
    var history: String
}
struct ArmamentModel {
    var armament: String
}
class FighterModel {
    init(flightname: String = "Default", flightID: Int? = nil,
         flightStringId: String? = nil, generalInfo: GeneralInfoModel? = nil,
         interestingFactsList: [InterestingFactModel]? = nil,
         flightOperatorsList: [FlightOperatorModel]? = nil,
         generalCharacteristicsList: [GeneralCharachteristicsModel]? = nil,
         peromanceList: [PerformanceModel]? = nil,
         combatHistoryList: [CombatHistoryModel]? = nil,
         armamentList: [ArmamentModel]? = nil,
         picturesList: [String]? = nil
    ) {
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
    init(flightname: String) {
        self.flightname = flightname
    }
    var flightname: String = "Default"
    var flightID: Int!
    var flightStringId: String!
    var generalInfo: GeneralInfoModel!
    var interestingFactsList: [InterestingFactModel]!
    var flightOperatorsList: [FlightOperatorModel]!
    var generalCharacteristicsList: [GeneralCharachteristicsModel]!
    var peromanceList: [PerformanceModel]!
    var combatHistoryList: [CombatHistoryModel]!
    var armamentList: [ArmamentModel]!
    var picturesList: [String]!
    func getGeneralCharachteristicsList() -> [KeyValuePair] {
        var list: [KeyValuePair] = [KeyValuePair]()
        for genCharacter in self.generalCharacteristicsList {
            list.append(KeyValuePair(title: genCharacter.title, detail: genCharacter.detail))
        }
        return list
    }
    func getPerformanceList() -> [KeyValuePair] {
        var list: [KeyValuePair] = [KeyValuePair]()
        for performance in self.peromanceList {
            list.append(KeyValuePair(title: performance.title, detail: performance.detail))
        }
        return list
    }
    func getGeneralInfoList() -> [KeyValuePair] {
        var list: [KeyValuePair] = [KeyValuePair]()
        list.append(KeyValuePair(title: "Role", detail: "\(generalInfo.role)"))
        list.append(KeyValuePair(title: "Manufacturer", detail: "\(generalInfo.manufacturer)"))
        list.append(KeyValuePair(title: "Designed By", detail: "\(generalInfo.designedBy)"))
        list.append(KeyValuePair(title: "First Flight", detail: "\(generalInfo.firstFlight)"))
        list.append(KeyValuePair(title: "Introduced", detail: "\(generalInfo.introduced)"))
        list.append(KeyValuePair(title: "Retired", detail: "\(generalInfo.retired)"))
        var tempUserData: String = ""
        for user in generalInfo.primaryUsers {
            tempUserData += "\(user.username) \n"
        }
        list.append(KeyValuePair(title: "Primary Users", detail: "\(tempUserData)"))
        list.append(KeyValuePair(title: "Number Built", detail: "\(generalInfo.numberBuilt)"))
        return list
    }
    func getFlagList() -> [String] {
        var tempList = [String]()
        for flag in self.flightOperatorsList {
            tempList.append(flag.countryName)
        }
        return tempList
    }
}
