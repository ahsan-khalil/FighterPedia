//
//  WallpaperCollectionViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 08/10/2020.
//

import UIKit

class WallpaperCollectionViewCell: UICollectionViewCell {
    static let identifier =  "wallpaperCollectionViewCell"
    
    @IBOutlet weak var imgWallpaper: UIImageView!
    
    func configure(imageStr:String){
        imgWallpaper.image = UIImage(named: imageStr)
    }
    
    
}
