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
    
    static func convertDateToStr(date:Date,formate:String) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = formate
        
        return dateFormatterPrint.string(from: date)
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
            return UIImage(named: "appLogo")
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
    
    static func validateInputForEmptyFields(inputCollection:[UITextField]) -> Bool {
        for inputField in inputCollection {
            guard let inputFieldtext = inputField.text else { return false }
            if (inputFieldtext.trimmingCharacters(in: [" "]).isEmpty){
                return false
            }
        }
        return true
    }
    
    static func showToast(message : String, viewController:UIViewController) {
        
        let toastLabel = UILabel(frame: CGRect(x: viewController.view.frame.size.width/2 - 75, y: viewController.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 5;
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        toastLabel.adjustsFontSizeToFitWidth = true
        toastLabel.minimumScaleFactor = 0.2
        viewController.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    static func generateAlertBox(title:String, message:String, viewController:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")


              @unknown default:
                fatalError("unknown value selected")
              }}))
        viewController.present(alert, animated: true, completion: nil)
        return
    }
}

