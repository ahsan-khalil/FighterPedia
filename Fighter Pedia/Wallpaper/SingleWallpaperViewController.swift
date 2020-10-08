//
//  SingleWallpaperViewController.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 08/10/2020.
//

import UIKit

class SingleWallpaperViewController: UIViewController {

    static let identifier = "singleWallpaperViewController"
    @IBOutlet weak var imgWallpaper: UIImageView!
    @IBOutlet weak var btnMoreInfo: UIButton!
    var imageSrc:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Wallpaper"
        imgWallpaper.image = UIImage(named: imageSrc)
        
        
    }
    
    

    
    @IBAction func onClickMoreInfo(_ sender: UIButton) {
        print("tapped")
    }
    
    func setImage(img:String){
        self.imageSrc = img
        
    }
}
