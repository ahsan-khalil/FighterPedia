//
//  FighterRepository.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 05/10/2020.
//

import Foundation
import CoreData

class FighterRepository {
    static func addFighterList(fighterModel: FighterModel) {
        let context  = Utility.getFighterPediaPersistanceContainerContext()
        let fighterJet = Fighter.init(context: context)
        fighterJet.flightName = fighterModel.flightname
//
        for flightOperatorObject in fighterModel.flightOperatorsList {
            let flightOperator = FlightOperator.init(context: context)
            flightOperator.addToFighter(fighterJet)
            fighterJet.addToFlightOperatorsList(flightOperator)
            flightOperator.countryFlag = flightOperatorObject.countryFlag
            flightOperator.countryName = flightOperatorObject.countryName
        }
        for generalCharacterisiticsObject in fighterModel.generalCharacteristicsList {
            let generalCharacteristics = GeneralCharacteristics.init(context: context)
            generalCharacteristics.fighter = fighterJet
            fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
            generalCharacteristics.title = generalCharacterisiticsObject.title
            generalCharacteristics.detail = generalCharacterisiticsObject.detail
        }
        for perf in fighterModel.peromanceList {
            let performance = Performance.init(context: context)
            performance.fighter = fighterJet
            fighterJet.addToPerformanceList(performance)
            performance.title = perf.title
            performance.detail = perf.detail
        }
//
        for pic in fighterModel.picturesList {
            let fighterPic = Picture.init(context: context)
            fighterPic.fighter = fighterJet
            fighterJet.addToPicturesList(fighterPic)
            fighterPic.picture = pic
        }
        let interestingFact = InterestingFacts.init(context: context)
        fighterJet.addToInterestingFactsList(interestingFact)
        interestingFact.fact = "Hermann Göring was a proponent of the Bf 110."
        interestingFact.fighter = fighterJet
        //
        let generalInfo = GeneralInfo.init(context: context)
        generalInfo.fighter = fighterJet
        //
        let generalInformationObject = fighterModel.generalInfo!
        generalInfo.role = generalInformationObject.role
        generalInfo.manufacturer = generalInformationObject.manufacturer
        generalInfo.designedBy = generalInformationObject.designedBy
        generalInfo.firstFlight = generalInformationObject.firstFlight
        generalInfo.introduced = Int32(generalInformationObject.introduced)
        generalInfo.retired = generalInformationObject.retired
        //
        generalInfo.numberBuilt = NSDecimalNumber(string: generalInformationObject.numberBuilt)
        for users in fighterModel.generalInfo.primaryUsers {
            let primaryUsers = PrimaryUser.init(context: context)
            primaryUsers.generalInfo = generalInfo
            generalInfo.addToPrimaryUser(primaryUsers)
            primaryUsers.username = users.username
        }
        //
        fighterJet.generalInfo = generalInfo
        let combatHistory = CombatHistory.init(context: context)
        combatHistory.fighter = fighterJet
        combatHistory.history = "During the Balkans Campaign, North African Campaign"
        fighterJet.addToCombatHistoryList(combatHistory)
        //
        let armament = Armament.init(context: context)
        armament.armament = "2x 20 mm MG FF/M cannons (180 rounds per gun"
        armament.fighter = fighterJet
        fighterJet.addToArmamentList(armament)
        do {
            try context.save()
            print("data added successfully")
        } catch {
            print("exception: can't save")
        }
    }
    private static func getGeneralInfo(fighterDTO: Fighter) -> GeneralInfoModel {
        let generalInfoDTO: GeneralInfo = fighterDTO.generalInfo!
        var users = [PrimaryUsersModel]()
        //Primary Users of General Info
        if let primaryUsersDTOList = generalInfoDTO.primaryUser?.allObjects as? [PrimaryUser] {
            for primaryUserDTO in primaryUsersDTOList {
                users.append(PrimaryUsersModel(username: primaryUserDTO.username!))
            }
        } else {
            print("Primary Users list is empty for fighter: \(String(fighterDTO.flightName ?? "nil"))")
        }
        let generalInfo = GeneralInfoModel(role: generalInfoDTO.role!,
                                                    manufacturer: generalInfoDTO.manufacturer!,
                                                    designedBy: generalInfoDTO.designedBy!,
                                                    firstFlight: generalInfoDTO.firstFlight!,
                                                    introduced: Int(generalInfoDTO.introduced),
                                                    retired: generalInfoDTO.retired!,
                                                    primaryUsers: users,
                                                    numberBuilt: "\(generalInfoDTO.numberBuilt ?? 6000)"
                                            )
        return generalInfo
    }
    private static func getInterestingInfo(fighterDTO: Fighter) -> [InterestingFactModel] {
        var interestingFactList = [InterestingFactModel]()
        if let interestingFactDTOlist = fighterDTO.interestingFactsList?.allObjects as? [InterestingFacts] {
            for interestingFactDTO in interestingFactDTOlist {
                interestingFactList.append(InterestingFactModel(facts: interestingFactDTO.fact!))
            }
        } else {
            print("Interesting Facts list is empty for fighter: \(String(fighterDTO.flightName ?? "nil"))")
        }
        return interestingFactList
    }
    private static func getOperatorList(fighterDTO: Fighter) -> [FlightOperatorModel] {
        var flightOperatorsList = [FlightOperatorModel]()
        if let fighterOperatorDTOList = fighterDTO.flightOperatorsList?.allObjects as? [FlightOperator] {
            for fighterOperatorDTO in fighterOperatorDTOList {
                flightOperatorsList.append(
                    FlightOperatorModel(countryName: fighterOperatorDTO.countryName!,
                                        countryFlag: fighterOperatorDTO.countryFlag)
                )
            }
        } else {
            print("Operator list is empty for fighter: \(String(fighterDTO.flightName ?? "nil"))")
        }
        return flightOperatorsList
    }
    private static func getCombatHistoryList(fighterDTO: Fighter) -> [CombatHistoryModel] {
        var combatHistoryList = [CombatHistoryModel]()
        if let combatHistoryDTOList = fighterDTO.combatHistoryList?.allObjects as? [CombatHistory] {
            for combatHistoryDTO in combatHistoryDTOList {
                combatHistoryList.append(CombatHistoryModel(history: combatHistoryDTO.history!))
            }
        } else {
            print("History list is empty for fighter: \(String(fighterDTO.flightName ?? "nil"))")
        }
        return combatHistoryList
    }
    private static func getGeneralCharacteristicsList(fighterDTO: Fighter) -> [GeneralCharachteristicsModel] {
        var generalCharacteristicsList = [GeneralCharachteristicsModel]()
        if let generalCharacteristicsDTOList =
            fighterDTO.generalCharacterislticslist?.allObjects as? [GeneralCharacteristics] {
            for generalCharacteristicsDTO in generalCharacteristicsDTOList {
                generalCharacteristicsList.append(
                    GeneralCharachteristicsModel(title: generalCharacteristicsDTO.title!,
                                                 detail: generalCharacteristicsDTO.detail!)
                )
            }
        } else {
            print("Characteristics list is empty for fighter: \(String(fighterDTO.flightName ?? "nil"))")
        }
        return generalCharacteristicsList
    }
    private static func getPerformanceList(fighterDTO: Fighter) -> [PerformanceModel] {
        var peromanceList = [PerformanceModel]()
        if let performanceDTOList = fighterDTO.performanceList?.allObjects as? [Performance] {
            for performanceDTO in performanceDTOList {
                peromanceList.append(
                    PerformanceModel(title: performanceDTO.title!, detail: performanceDTO.detail!)
                )
            }
        } else {
            print("Performance list is empty for fighter: \(String(fighterDTO.flightName ?? "nil"))")
        }
        return peromanceList
    }
    private static func getArmamentList(fighterDTO: Fighter) -> [ArmamentModel] {
        var armamentList = [ArmamentModel]()
        if let armamentDTOList = fighterDTO.armamentList?.allObjects as? [Armament] {
            for armamentDTO in armamentDTOList {
                armamentList.append(ArmamentModel(armament: armamentDTO.armament!))
            }
        } else {
            print("Armament list is empty for fighter: \(String(fighterDTO.flightName ?? "nil"))")
        }
        return armamentList
    }
    private static func getPictureList(fighterDTO: Fighter) -> [String] {
        var picturesList = [String]()
        if let pictureDTOList = fighterDTO.picturesList?.allObjects as? [Picture] {
            for pictureDTO in pictureDTOList {
                picturesList.append(pictureDTO.picture!)
            }
        } else {
            print("Picture list is empty for fighter: \(String(fighterDTO.flightName ?? "nil"))")
        }
        return picturesList
    }
    static func getFighterList() -> [FighterModel] {
        var fighterList = [FighterModel]()
        let context = Utility.getFighterPediaPersistanceContainerContext()
        do {
            let fighterDTOList: [Fighter] = try context.fetch(Fighter.fetchRequest())
            for fighterDTO in fighterDTOList {
                let fighterModel = FighterModel(flightname: fighterDTO.flightName ?? "Name doesn't exists")
                fighterModel.flightStringId = fighterModel.flightname
                //Primary Users
                //General Info
                fighterModel.generalInfo = getGeneralInfo(fighterDTO: fighterDTO)
                //Interesting Info
                fighterModel.interestingFactsList = getInterestingInfo(fighterDTO: fighterDTO)
                //Fighter Operator List
                fighterModel.flightOperatorsList = getOperatorList(fighterDTO: fighterDTO)
                //Combat History List
                fighterModel.combatHistoryList = getCombatHistoryList(fighterDTO: fighterDTO)
                //General Characteristics
                fighterModel.generalCharacteristicsList = getGeneralCharacteristicsList(fighterDTO: fighterDTO)
                //Performance List
                fighterModel.peromanceList = getPerformanceList(fighterDTO: fighterDTO)
                //Armament List
                fighterModel.armamentList = getArmamentList(fighterDTO: fighterDTO)
                //Picture List
                fighterModel.picturesList = getPictureList(fighterDTO: fighterDTO)
                fighterList.append(fighterModel)
            }
        } catch {
            print("Can't get data")
        }
        return fighterList
    }
    static func getErasList() -> [ErasYearRangeModel] {
        var dateRangeList = [ErasYearRangeModel]()
        dateRangeList.append(ErasYearRangeModel(startYear: 1901, endYear: 1910))
        dateRangeList.append(ErasYearRangeModel(startYear: 1911, endYear: 1920))
        dateRangeList.append(ErasYearRangeModel(startYear: 1921, endYear: 1930))
        dateRangeList.append(ErasYearRangeModel(startYear: 1931, endYear: 1940))
        dateRangeList.append(ErasYearRangeModel(startYear: 1941, endYear: 1950))
        dateRangeList.append(ErasYearRangeModel(startYear: 1951, endYear: 1960))
        dateRangeList.append(ErasYearRangeModel(startYear: 1961, endYear: 1970))
        dateRangeList.append(ErasYearRangeModel(startYear: 1971, endYear: 1980))
        dateRangeList.append(ErasYearRangeModel(startYear: 1981, endYear: 1990))
        dateRangeList.append(ErasYearRangeModel(startYear: 1991, endYear: 2000))
        dateRangeList.append(ErasYearRangeModel(startYear: 2001, endYear: 2010))
        dateRangeList.append(ErasYearRangeModel(startYear: 2011, endYear: 2020))
        return dateRangeList
    }

    static func getFightersInYearsRange(startYear: Int, endYear: Int) -> [FighterModel] {
        return getFighterList()
    }

    static func displayData() {
        let context = Utility.getFighterPediaPersistanceContainerContext()
        do {
            let fighterDTOList: [Fighter] = try context.fetch(Fighter.fetchRequest())
            for fighterDTO in fighterDTOList {
                print(fighterDTO.flightName!)
                print("primary users start")
                guard let primaryUsersList = fighterDTO.generalInfo?.primaryUser?.allObjects as? [PrimaryUser] else {
                    print("No primary user exists")
                    return
                }
                for primaryUsesrDTO in primaryUsersList {
                    print(primaryUsesrDTO.username!)
                }
                print("primary Users end")
            }
        } catch {
            print("can't fetch")
        }
    }
}
