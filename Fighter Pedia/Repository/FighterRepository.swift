//
//  FighterRepository.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 05/10/2020.
//

import Foundation
import CoreData


class FighterRepository{
    static func AddFighterList() {
        let context  = Utility.getFighterPediaPersistanceContainerContext()
        
        let fighterJet = Fighter.init(context: context)
        fighterJet.flightName = "Messerschmitt Bf 111"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let firstdate = formatter.date(from: "12 May 1936")
        
        var flightOperator = FlightOperator.init(context: context)
        flightOperator.addToFighter(fighterJet)
        fighterJet.addToFlightOperatorsList(flightOperator)
        flightOperator.countryFlag = "Germany"
        flightOperator.countryName = "Germany"
        
        flightOperator = FlightOperator.init(context: context)
        flightOperator.addToFighter(fighterJet)
        fighterJet.addToFlightOperatorsList(flightOperator)
        flightOperator.countryFlag = "Hungary"
        flightOperator.countryName = "Hungary"
        
        flightOperator = FlightOperator.init(context: context)
        flightOperator.addToFighter(fighterJet)
        fighterJet.addToFlightOperatorsList(flightOperator)
        flightOperator.countryFlag = "Italy"
        flightOperator.countryName = "Italy"
        
        flightOperator = FlightOperator.init(context: context)
        flightOperator.addToFighter(fighterJet)
        fighterJet.addToFlightOperatorsList(flightOperator)
        flightOperator.countryFlag = "Romania"
        flightOperator.countryName = "Romania"
        
        flightOperator = FlightOperator.init(context: context)
        flightOperator.addToFighter(fighterJet)
        fighterJet.addToFlightOperatorsList(flightOperator)
        flightOperator.countryFlag = "Independent State of Croatia"
        flightOperator.countryName = "Independent State of Croatia"
        
        flightOperator = FlightOperator.init(context: context)
        flightOperator.addToFighter(fighterJet)
        fighterJet.addToFlightOperatorsList(flightOperator)
        flightOperator.countryFlag = "Soviet Union"
        flightOperator.countryName = "Soviet Union"
        
        var generalCharacteristics = GeneralCharacteristics.init(context: context)
        generalCharacteristics.fighter = fighterJet
        fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
        generalCharacteristics.title = "Crew"
        generalCharacteristics.detail = "2 (3 for night fighter variants)"
        
        generalCharacteristics = GeneralCharacteristics.init(context: context)
        generalCharacteristics.fighter = fighterJet
        fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
        generalCharacteristics.title = "Length"
        generalCharacteristics.detail = "12.3 m (40 ft 6 in)"
        
        generalCharacteristics = GeneralCharacteristics.init(context: context)
        generalCharacteristics.fighter = fighterJet
        fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
        generalCharacteristics.title = "Wingspan"
        generalCharacteristics.detail = "16.3 m (53 ft 4 in)"
        
        generalCharacteristics = GeneralCharacteristics.init(context: context)
        generalCharacteristics.fighter = fighterJet
        fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
        generalCharacteristics.title = "Height"
        generalCharacteristics.detail = "3.3 m (10 ft 9 in)"
        
        generalCharacteristics = GeneralCharacteristics.init(context: context)
        generalCharacteristics.fighter = fighterJet
        fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
        generalCharacteristics.title = "Wing Area"
        generalCharacteristics.detail = "38.8 m² (414 ft²)"
        
        generalCharacteristics = GeneralCharacteristics.init(context: context)
        generalCharacteristics.fighter = fighterJet
        fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
        generalCharacteristics.title = "Empty Weight"
        generalCharacteristics.detail = "4,500 kg (9,900 lb)"
        
        generalCharacteristics = GeneralCharacteristics.init(context: context)
        generalCharacteristics.fighter = fighterJet
        fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
        generalCharacteristics.title = "Loaded Weight"
        generalCharacteristics.detail = "6,700 kg (14,800 lb)"
        
        generalCharacteristics = GeneralCharacteristics.init(context: context)
        generalCharacteristics.fighter = fighterJet
        fighterJet.addToGeneralCharacterislticslist(generalCharacteristics)
        generalCharacteristics.title = "Powerplant"
        generalCharacteristics.detail = "2× Daimler-Benz DB 601B-1 liquid-cooled inverted V-12, 809 kW (1,100 hp) each"
        
        var performance = Performance.init(context: context)
        performance.fighter = fighterJet
        fighterJet.addToPerformanceList(performance)
        performance.title = "Maximum Speed"
        performance.detail = "560 km/h (348 mph)"
        
        performance = Performance.init(context: context)
        performance.fighter = fighterJet
        fighterJet.addToPerformanceList(performance)
        performance.title = "Range"
        performance.detail = "2,410 km combat, 2,800 km ferry (1,500 mi / 1,750 mi)"
        
        performance = Performance.init(context: context)
        performance.fighter = fighterJet
        fighterJet.addToPerformanceList(performance)
        performance.title = "Service Ceiling"
        performance.detail = "10,500 m (35,000 ft)"
        
        performance = Performance.init(context: context)
        performance.fighter = fighterJet
        fighterJet.addToPerformanceList(performance)
        performance.title = "Wing Loading"
        performance.detail = "173 kg/m² (35.7 lb/ft²"
        
        performance = Performance.init(context: context)
        performance.fighter = fighterJet
        fighterJet.addToPerformanceList(performance)
        performance.title = "Power/mass"
        performance.detail = "0.3644 kW/kg (0.155 hp/lb)"
        
        var fighterPic = Picture.init(context: context)
        fighterPic.fighter = fighterJet
        fighterJet.addToPicturesList(fighterPic)
        fighterPic.picture = "MesserschmittBf109_cellimage_pressed"
        
        fighterPic = Picture.init(context: context)
        fighterPic.fighter = fighterJet
        fighterJet.addToPicturesList(fighterPic)
        fighterPic.picture = "MesserschmittBf109_cellimage_unpressed"
        
        fighterPic = Picture.init(context: context)
        fighterPic.fighter = fighterJet
        fighterJet.addToPicturesList(fighterPic)
        fighterPic.picture = "MesserschmittBf109_scroll_image_1"
        
        fighterPic = Picture.init(context: context)
        fighterPic.fighter = fighterJet
        fighterJet.addToPicturesList(fighterPic)
        fighterPic.picture = "MesserschmittBf109_scroll_image_2"
        
        fighterPic = Picture.init(context: context)
        fighterPic.fighter = fighterJet
        fighterJet.addToPicturesList(fighterPic)
        fighterPic.picture = "MesserschmittBf109_scroll_image_3"
        
        fighterPic = Picture.init(context: context)
        fighterPic.fighter = fighterJet
        fighterJet.addToPicturesList(fighterPic)
        fighterPic.picture = "MesserschmittBf109_scroll_image_4"
        
        
        
        var interestingFact = InterestingFacts.init(context: context)
        fighterJet.addToInterestingFactsList(interestingFact)
        interestingFact.fighter = fighterJet
        interestingFact.fact = "Hermann Göring was a proponent of the Bf 110, and nicknamed it his Eisenseiten, or \"Ironsides\"."
        
        interestingFact = InterestingFacts.init(context: context)
        fighterJet.addToInterestingFactsList(interestingFact)
        interestingFact.fighter = fighterJet
        interestingFact.fact = "The Bf 110s lack of agility in the air was its primary weakness."
        
        interestingFact = InterestingFacts.init(context: context)
        fighterJet.addToInterestingFactsList(interestingFact)
        interestingFact.fighter = fighterJet
        interestingFact.fact = "Three intact Bf 110 are known to exist, although one of them is rebuilt from rescued parts from several different airframes."
        

        let generalInfo = GeneralInfo.init(context: context)
        generalInfo.fighter = fighterJet
        
        generalInfo.role = "Heavy fighter/Fighter-bomber/Night fighter"
        generalInfo.manufacturer = "Bayerische Flugzeugwerke Messerschmitt"
        generalInfo.designedBy = "Willy Messerschmitt"
        generalInfo.firstFlight = firstdate
        generalInfo.introduced = 1937
        generalInfo.retired = "1945 (Luftwaffe)"
        
        generalInfo.numberBuilt = 6170
        
        var primaryUsers = PrimaryUser.init(context: context)
        primaryUsers.addToGeneralInfo(generalInfo)
        
        generalInfo.addToPrimaryUser(primaryUsers)
        primaryUsers.username = "Luftwaffe"
        
        primaryUsers = PrimaryUser.init(context: context)
        primaryUsers.addToGeneralInfo(generalInfo)
        generalInfo.addToPrimaryUser(primaryUsers)
        primaryUsers.username = "Hungarian Air Force"
        
        primaryUsers = PrimaryUser.init(context: context)
        primaryUsers.addToGeneralInfo(generalInfo)
        generalInfo.addToPrimaryUser(primaryUsers)
        primaryUsers.username = "Regia Aeronautica"
        
        primaryUsers = PrimaryUser.init(context: context)
        primaryUsers.addToGeneralInfo(generalInfo)
        generalInfo.addToPrimaryUser(primaryUsers)
        primaryUsers.username = "Romanian Air Force"
        
        
        fighterJet.generalInfo = generalInfo
        
        //Combat History Starts here
        var combatHistory = CombatHistory.init(context: context)
        combatHistory.history = "The Bf 110s lack of agility in the air was its primary weakness. This flaw was exposed during the Battle of Britain, when some Bf 110 equipped units were withdrawn from the battle after very heavy losses and redeployed as night-fighters, a role to which the aircraft was well suited."
        combatHistory.fighter = fighterJet
        
        
        combatHistory = CombatHistory.init(context: context)
        combatHistory.history = "The Bf 110 enjoyed a successful period following the defeat over Britain as air superiority fighter and strike aircraft."
        combatHistory.fighter = fighterJet
        fighterJet.addToCombatHistoryList(combatHistory)
        
        combatHistory = CombatHistory.init(context: context)
        combatHistory.history = "During the Balkans Campaign, North African Campaign and the Eastern Front it rendered valuable ground support to the German Army as a potent fighter-bomber, (JagdBomber-Jabo)."
        combatHistory.fighter = fighterJet
        fighterJet.addToCombatHistoryList(combatHistory)
        
        combatHistory = CombatHistory.init(context: context)
        combatHistory.history = "During the Balkans Campaign, North African Campaign and the Eastern Front it rendered valuable ground support to the German Army as a potent fighter-bomber, (JagdBomber-Jabo)."
        combatHistory.fighter = fighterJet
        fighterJet.addToCombatHistoryList(combatHistory)
        
        combatHistory = CombatHistory.init(context: context)
        combatHistory.history = "During the Balkans Campaign, North African Campaign and the Eastern Front it rendered valuable ground support to the German Army as a potent fighter-bomber, (JagdBomber-Jabo)."
        combatHistory.fighter = fighterJet
        fighterJet.addToCombatHistoryList(combatHistory)
        
        combatHistory = CombatHistory.init(context: context)
        combatHistory.history = "Later in the war it was changed further to night fighter operations, and it became the major night fighter type of the Luftwaffe. Most of the German night-fighter aces flew the Bf 110 at some point during their combat careers."
        combatHistory.fighter = fighterJet
        fighterJet.addToCombatHistoryList(combatHistory)
        
        //Armament List starts here
        var armament = Armament.init(context: context)
        armament.armament = "2x 20 mm MG FF/M cannons (180 rounds per gun - 3 drums with 60 rounds each, cannon were reloaded by rear gunner or radio operator during flight)"
        armament.fighter = fighterJet
        fighterJet.addToArmamentList(armament)
        
        armament = Armament.init(context: context)
        armament.armament = "4x 7.92 mm MG 17 machine guns (1000 rounds per gun)"
        armament.fighter = fighterJet
        fighterJet.addToArmamentList(armament)
        
        armament = Armament.init(context: context)
        armament.armament = "1x 7.92 mm MG 15 for defense"
        armament.fighter = fighterJet
        fighterJet.addToArmamentList(armament)
        
        
        do {
            try context.save()
            print("data added successfully")
            
        } catch  {
            print("exception: can't save")
        }
        
    }
    
    
    
    
    static func getFighterList() -> [FighterModel] {
        //Get Data
        var fighterList = [FighterModel]()
        let context = Utility.getFighterPediaPersistanceContainerContext()
        do {
            let fighterDTOList:[Fighter] = try context.fetch(Fighter.fetchRequest())

            for fighterDTO in fighterDTOList {

                let fighterModel = FighterModel(flightname: fighterDTO.flightName ?? "Name doesn't exists")
                fighterModel.flightStringId = fighterModel.flightname
                
                //Primary Users
                
                
                //General Info
                let generalInfoDTO:GeneralInfo = fighterDTO.generalInfo!
                
                var users = [PrimaryUsersModel]()
                let primaryUsersDTOList = generalInfoDTO.primaryUser?.allObjects as! [PrimaryUser]
                for primaryUserDTO in primaryUsersDTOList {
                    users.append(PrimaryUsersModel(username: primaryUserDTO.username!))
                }
                fighterModel.generalInfo = GeneralInfoModel(role: generalInfoDTO.role!, manufacturer: generalInfoDTO.manufacturer!, designedBy: generalInfoDTO.designedBy!, FirstFlight: generalInfoDTO.firstFlight!, introduced: Int(generalInfoDTO.introduced), retired: generalInfoDTO.retired!, PrimaryUsers: users, numberBuilt: "\(generalInfoDTO.numberBuilt ?? 6000)")
                
                
                
                //Interesting Info
                fighterModel.interestingFactsList = [InterestingFactModel]()
                let interestingFactDTOlist = fighterDTO.interestingFactsList?.allObjects as! [InterestingFacts]
                
                for interestingFactDTO in interestingFactDTOlist {
                    fighterModel.interestingFactsList.append(InterestingFactModel(facts: interestingFactDTO.fact!))
                }
                
                //Fighter Operator List
                fighterModel.flightOperatorsList = [FlightOperatorModel]()
                let fighterOperatorDTOList = fighterDTO.flightOperatorsList?.allObjects as! [FlightOperator]
                for fighterOperatorDTO in fighterOperatorDTOList {
                    fighterModel.flightOperatorsList.append(FlightOperatorModel(countryName: fighterOperatorDTO.countryName!, countryFlag: fighterOperatorDTO.countryFlag))
                }
                
                //Combat History List
                fighterModel.combatHistoryList = [CombatHistoryModel]()
                let combatHistoryDTOList = fighterDTO.combatHistoryList?.allObjects as! [CombatHistory]
                for combatHistoryDTO in combatHistoryDTOList {
                    fighterModel.combatHistoryList.append(CombatHistoryModel(history: combatHistoryDTO.history!))
                }
                
                //General Characteristics
                fighterModel.generalCharacteristicsList = [GeneralCharachteristicsModel]()
                let generalCharacteristicsDTOList = fighterDTO.generalCharacterislticslist?.allObjects as! [GeneralCharacteristics]
                for generalCharacteristicsDTO in generalCharacteristicsDTOList {
                    fighterModel.generalCharacteristicsList.append(GeneralCharachteristicsModel(title: generalCharacteristicsDTO.title!, detail: generalCharacteristicsDTO.detail!))
                }
                
                //Performance List
                fighterModel.peromanceList = [PerformanceModel]()
                let performanceDTOList = fighterDTO.performanceList?.allObjects as! [Performance]
                for performanceDTO in performanceDTOList {
                    fighterModel.peromanceList.append(PerformanceModel(title: performanceDTO.title!, detail: performanceDTO.detail!))
                }
                
                //Armament List
                fighterModel.armamentList = [ArmamentModel]()
                let armamentDTOList = fighterDTO.armamentList?.allObjects as! [Armament]
                for armamentDTO in armamentDTOList {
                    fighterModel.armamentList.append(ArmamentModel(armament: armamentDTO.armament!))
                }
                
                //Picture List
                fighterModel.picturesList = [String]()
                let pictureDTOList = fighterDTO.picturesList?.allObjects as! [Picture]
                for pictureDTO in pictureDTOList {
                    fighterModel.picturesList.append(pictureDTO.picture!)
                }
                fighterList.append(fighterModel)
            }
        } catch  {
            print("Can't get data")
            
        }
        return fighterList
    }
    
    
    static func getErasList() -> [ErasYearRangeModel] {
        var dateRangeList = [ErasYearRangeModel]()


        dateRangeList.append(ErasYearRangeModel(StartYear: 1901, EndYear: 1910))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1911, EndYear: 1920))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1921, EndYear: 1930))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1931, EndYear: 1940))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1941, EndYear: 1950))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1951, EndYear: 1960))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1961, EndYear: 1970))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1971, EndYear: 1980))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1981, EndYear: 1990))
        dateRangeList.append(ErasYearRangeModel(StartYear: 1991, EndYear: 2000))
        dateRangeList.append(ErasYearRangeModel(StartYear: 2001, EndYear: 2010))
        dateRangeList.append(ErasYearRangeModel(StartYear: 2011, EndYear: 2020))


        return dateRangeList
    }
    
    static func getFightersInYearsRange(StartYear:Int,EndYear:Int) -> [FighterModel] {
        return getFighterList()
    }
    
    static func displayData() {
        let context = Utility.getFighterPediaPersistanceContainerContext()
        do {
            let fighterDTOList:[Fighter] = try context.fetch(Fighter.fetchRequest())
            for fighterDTO in fighterDTOList {
                print(fighterDTO.flightName!)
                print("primary users start")
                let primaryUsersList = fighterDTO.generalInfo?.primaryUser?.allObjects as! [PrimaryUser]
                for primaryUsesrDTO in primaryUsersList{
                    print(primaryUsesrDTO.username!)
                }
                print("primary Users end")
                
                
            }
        } catch  {
            print("can't fetch")
        }
        
        
        
    }
    
    
    
}
