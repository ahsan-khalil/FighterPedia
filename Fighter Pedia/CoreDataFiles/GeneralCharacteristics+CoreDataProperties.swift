//
//  GeneralCharacteristics+CoreDataProperties.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 12/10/2020.
//
//

import Foundation
import CoreData


extension GeneralCharacteristics {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeneralCharacteristics> {
        return NSFetchRequest<GeneralCharacteristics>(entityName: "GeneralCharacteristics")
    }

    @NSManaged public var title: String?
    @NSManaged public var detail: String?
    @NSManaged public var fighter: Fighter?

}

extension GeneralCharacteristics : Identifiable {

}
