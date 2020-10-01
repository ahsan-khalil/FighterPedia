//
//  ImageCollectionViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil on 01/10/2020.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    public static let resuseIdentifier = "ImageCollectionViewCell"
   
    @IBOutlet weak var imgFighter: UIImageView!
    
    
    public static func nib() -> UINib {
        return UINib(nibName: resuseIdentifier, bundle: nil)
    }
    
    public func configure(){
        
    }
    
}
