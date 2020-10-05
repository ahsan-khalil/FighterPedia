//
//  FighterRepository.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 05/10/2020.
//

import Foundation

class FighterRepository{
    static func getFighterList() -> [Fighter] {
        var fighterList = [Fighter]()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let firstdate = formatter.date(from: "12 May 1936")
        
        let tempFighter = Fighter(flightname: "Messerschmitt Bf 110 (Nazi Germany)")
        tempFighter.flightStringId = "Messerschmitt Bf 110 (Nazi Germany)"
        
        var users = [PrimaryUsers]()
        users.append(PrimaryUsers(username: "Luftwaffe"))
        users.append(PrimaryUsers(username: "Hungarian Air Force"))
        users.append(PrimaryUsers(username: "Regia Aeronautica"))
        users.append(PrimaryUsers(username: "Romanian Air Force"))
        
        let tempGeneralInfo = GeneralInfo(role: "Heavy fighter/Fighter-bomber/Night fighter", manufacturer: "Bayerische Flugzeugwerke Messerschmitt", designedBy: "Willy Messerschmitt", FirstFlight: firstdate!, introduced: 1937, retired: "1945 (Luftwaffe)", PrimaryUsers: users, numberBuilt: "6,170")
        tempFighter.generalInfo = tempGeneralInfo
        
        tempFighter.interestingFactsList = [InterestingFact]()
        tempFighter.interestingFactsList.append(InterestingFact(facts: "Hermann Göring was a proponent of the Bf 110, and nicknamed it his Eisenseiten, or \"Ironsides\"."))
        tempFighter.interestingFactsList.append(InterestingFact(facts: "The Bf 110s lack of agility in the air was its primary weakness."))
        tempFighter.interestingFactsList.append(InterestingFact(facts: "Three intact Bf 110 are known to exist, although one of them is rebuilt from rescued parts from several different airframes."))
       
        tempFighter.flightOperatorsList = [FlightOperator]()
        tempFighter.flightOperatorsList.append(FlightOperator(countryName: "Germany", countryFlag: nil))
        tempFighter.flightOperatorsList.append(FlightOperator(countryName: "Hungary", countryFlag: nil))
        tempFighter.flightOperatorsList.append(FlightOperator(countryName: "Italy", countryFlag: nil))
        tempFighter.flightOperatorsList.append(FlightOperator(countryName: "Romania", countryFlag: nil))
        tempFighter.flightOperatorsList.append(FlightOperator(countryName: "Independent State of Croatia", countryFlag: nil))
        tempFighter.flightOperatorsList.append(FlightOperator(countryName: "Soviet Union", countryFlag: nil))
        
        
        tempFighter.combatHistoryList = [CombatHistory]()
        tempFighter.combatHistoryList.append(CombatHistory(history: "The Bf 110s lack of agility in the air was its primary weakness. This flaw was exposed during the Battle of Britain, when some Bf 110 equipped units were withdrawn from the battle after very heavy losses and redeployed as night-fighters, a role to which the aircraft was well suited."))
        
        tempFighter.combatHistoryList.append(CombatHistory(history: "The Bf 110 enjoyed a successful period following the defeat over Britain as air superiority fighter and strike aircraft."))
        
        tempFighter.combatHistoryList.append(CombatHistory(history: "During the Balkans Campaign, North African Campaign and the Eastern Front it rendered valuable ground support to the German Army as a potent fighter-bomber, (JagdBomber-Jabo)."))
        
        tempFighter.combatHistoryList.append(CombatHistory(history: "Later in the war it was changed further to night fighter operations, and it became the major night fighter type of the Luftwaffe. Most of the German night-fighter aces flew the Bf 110 at some point during their combat careers."))
        
        tempFighter.generalCharacteristicsList = [GeneralCharachteristics]()
        tempFighter.generalCharacteristicsList.append(GeneralCharachteristics(title: "Crew", detail: "2 (3 for night fighter variants)"))
        tempFighter.generalCharacteristicsList.append(GeneralCharachteristics(title: "Lenght", detail: "12.3 m (40 ft 6 in)"))
        tempFighter.generalCharacteristicsList.append(GeneralCharachteristics(title: "Wingspan", detail: "16.3 m (53 ft 4 in)"))
        tempFighter.generalCharacteristicsList.append(GeneralCharachteristics(title: "Height", detail: "3.3 m (10 ft 9 in)"))
        tempFighter.generalCharacteristicsList.append(GeneralCharachteristics(title: "Wing Area", detail: "38.8 m² (414 ft²)"))
        tempFighter.generalCharacteristicsList.append(GeneralCharachteristics(title: "Empty Weight", detail: "4,500 kg (9,900 lb)"))
        tempFighter.generalCharacteristicsList.append(GeneralCharachteristics(title: "Loaded Weight", detail: "6,700 kg (14,800 lb)"))
        tempFighter.generalCharacteristicsList.append(GeneralCharachteristics(title: "Powerplant", detail: "2× Daimler-Benz DB 601B-1 liquid-cooled inverted V-12, 809 kW (1,100 hp) each"))
        
        tempFighter.peromanceList = [Performance]()
        tempFighter.peromanceList.append(Performance(title: "Maximum Speed", detail: "560 km/h (348 mph)"))
        tempFighter.peromanceList.append(Performance(title: "Range", detail: "2,410 km combat, 2,800 km ferry (1,500 mi / 1,750 mi)"))
        tempFighter.peromanceList.append(Performance(title: "Service Ceiling", detail: "10,500 m (35,000 ft)"))
        tempFighter.peromanceList.append(Performance(title: "Wing Loading", detail: "173 kg/m² (35.7 lb/ft²)"))
        tempFighter.peromanceList.append(Performance(title: "Power/mass", detail: "0.3644 kW/kg (0.155 hp/lb)"))
        
        tempFighter.armamentList = [Armament]()
        tempFighter.armamentList.append(Armament(armament: "2x 20 mm MG FF/M cannons (180 rounds per gun - 3 drums with 60 rounds each, cannon were reloaded by rear gunner or radio operator during flight)"))
        tempFighter.armamentList.append(Armament(armament: "4x 7.92 mm MG 17 machine guns (1000 rounds per gun)"))
        tempFighter.armamentList.append(Armament(armament: "1x 7.92 mm MG 15 for defense"))
        
        
        
        tempFighter.picturesList = [String]()
        tempFighter.picturesList.append("MesserschmittBf109_cellimage_pressed")
        tempFighter.picturesList.append("MesserschmittBf109_cellimage_unpressed")
        tempFighter.picturesList.append("MesserschmittBf109_scroll_image_1")
        tempFighter.picturesList.append("MesserschmittBf109_scroll_image_2")
        tempFighter.picturesList.append("MesserschmittBf109_scroll_image_3")
        tempFighter.picturesList.append("MesserschmittBf109_scroll_image_4")
        
        
        fighterList.append(tempFighter)
        fighterList.append(tempFighter)
        fighterList.append(tempFighter)
        fighterList.append(tempFighter)
        fighterList.append(tempFighter)
        
        
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
    
    static func getFightersInYearsRange(StartYear:Int,EndYear:Int) -> [Fighter] {
        return getFighterList()
    }
    
    
    
    
    
}
