//
//  Utility.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 09/10/2020.
//

import Foundation
import CoreData

class Utility
{
        
    private static let fighterPediaPersistentContainer: NSPersistentContainer = {
                let container = NSPersistentContainer(name: "FighterPediaDataModel")
                container.loadPersistentStores { description, error in
                    if let error = error {
                        fatalError("Unable to load persistent stores: \(error)")
                    }
                }
                return container
            }()
    
    static func getFighterPediaPersistanceContainerContext() -> NSManagedObjectContext {
        return self.fighterPediaPersistentContainer.viewContext
    }
    
    
    static func saveContext() {
        let context = self.fighterPediaPersistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
