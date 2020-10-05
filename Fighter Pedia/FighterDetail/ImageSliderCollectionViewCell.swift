//
//  ImageSliderCollectionViewCell.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 05/10/2020.
//

import UIKit

class ImageSliderCollectionViewCell: UICollectionViewCell {

    static let identifier = "ImageSliderCollectionViewCell"
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(image:String){
        self.image.image = UIImage(named: image)
    }
    

}
