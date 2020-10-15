//
//  Utility.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 09/10/2020.
//

import Foundation
import UIKit
import CoreData

class Utility
{
    static func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        //let scale = newWidth / image.size.width
        
        let newHeight = newWidth
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
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
    
    static func dateFormator(date:String) ->Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let firstdate = formatter.date(from: date)
        return firstdate
    }
    
    static func saveImage(imageName: String, image:UIImage){
       //create an instance of the FileManager
       let fileManager = FileManager.default
       //get the image path
       let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
       
       //get the PNG data for this image
        let data = image.pngData()
       //store it in the document directory
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
    }
    static func retriveImage(imageName: String) -> UIImage? {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath){
           let image = UIImage(contentsOfFile: imagePath)
            print("image retrived")
           return image
        }else{
           print("Panic! No Image!")
            return nil
        }
     }
    static func getUniqueImageName(picFormate:String) -> String {
        let date :Date = Date()

        let dateFormatter = DateFormatter()
                //dateFormatter.dateFormat = "yyyy-MM-dd'_'HH:mm:ss"
        dateFormatter.dateFormat = "yyyy-MM-dd'_'HH_mm_ss"

        let imageName = "/\(dateFormatter.string(from: date)).\(picFormate)"
        return imageName
    }
}

